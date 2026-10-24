export async function transferParts(parts,sink,{fetchPart=fetch,digest=bytes=>crypto.subtle.digest('SHA-256',bytes),progress=()=>{}}={}) {
  let total=0;
  for(let i=0;i<parts.length;i++){
    const part=parts[i];progress(i,parts.length,total);
    const response=await fetchPart(part.name);if(!response.ok)throw Error('Falha ao baixar a parte '+(i+1));
    const bytes=await response.arrayBuffer();if(bytes.byteLength!==part.size)throw Error('Parte '+(i+1)+' incompleta');
    const hash=Array.from(new Uint8Array(await digest(bytes))).map(n=>n.toString(16).padStart(2,'0')).join('');
    if(hash!==part.sha256)throw Error('Integridade inválida na parte '+(i+1));
    await sink.write(bytes);total+=bytes.byteLength;
  }
  return total;
}

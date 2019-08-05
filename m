Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huXBj-0001wa-W9
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 03:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1huXBh-0001sd-14
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 03:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1huXBf-000379-2F
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 03:13:44 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:44376)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1huXBd-00036H-1y
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 03:13:41 -0400
Received: by mail-io1-xd44.google.com with SMTP id s7so165014895iob.11
 for <qemu-riscv@nongnu.org>; Mon, 05 Aug 2019 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyuxMo6Lz6AGtZo584o2I6qBlHqY92fe2F0vBgo45qw=;
 b=a5gWgFDoqu68WsAI3Juxo5s6+VGxatY3nbTqDpDecH7g7UlXYK9O9B9+nYJ1yxZJaA
 rVj3bWAu97LfmRywESzTzpWY6fhC7HdH85NNSC2G9Am//nQrEvaoQ90CiZtrcUpNBsmE
 yPnyGalUwkilVXunQSRz5gEDO3Fhj7T3xZm9kJHPVJzkdBO23qURJ8PAShBneAo2x6fT
 IsaCbXtBAPLyHCFuexzyNyJAVrEA8SI5nr4556Rw8vEKzCnvhNNlN5F+FiWHHkRa/7ZG
 b7qgfboatQ9jLUjKXtsYbtwGCfrjyT/k+gz4tptv/MONqkp/ZI54txLB+pUzpgg4ECYe
 3+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyuxMo6Lz6AGtZo584o2I6qBlHqY92fe2F0vBgo45qw=;
 b=hmCOa+OrxeJAHYUoDoFEqWU4tXvr+fTw9toFFPhrrmdPE+JwCSeUUU6+CP4VWUO6uw
 37DRdA+BA+azM6AqQ67sRcOUfYtEQXgbb5c5VK8Sy2AXaCfAgdbZsIR9xmsxGCtP4TDr
 z00ME3ACan9lfth11g0DnZbzPiGbpohd94WW0gT8ldCfU4nSK/WqhLJzLXsdlX3ms3hs
 wP4XoMI3C6rJYmYSjYL9276bo3APmZ3zEuCYPI627DPgndaSjy37a6nyz/kGMX6gRFV4
 JdzOY6OXQdwoGtVqKj8PcQMT3nkxaiecdioLXVEEJxorZuScqtQJM4O/w5yjei12/lXz
 9DBw==
X-Gm-Message-State: APjAAAX4a4rTY+PgyqdCWiOZfaixgGcofly/xlgBqEI0aPSNGsIpYiQD
 yvWar/fGOA1egN/bn7JjrHs1gDPXjXYofg7LVO4uSw==
X-Google-Smtp-Source: APXvYqzl40yVpYMwuGa9jP0xUHZ6Nhiq6W4dLrEQRRfrWPuSt1tAqMpoCfdNGZ3KxZUHFpGBr2sitxhFNiPdvQD9Vtg=
X-Received: by 2002:a02:a07:: with SMTP id 7mr154561604jaw.65.1564989220213;
 Mon, 05 Aug 2019 00:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 5 Aug 2019 15:13:27 +0800
Message-ID: <CAEiOBXW5Z5Jp7ooR+TQ5HcAdW2MoVTZQ9kZsqqw5P-yaPWtVUA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008c6ecf058f5972fa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-riscv] [FOR 4.1 PATCH] riscv: roms: Fix make rules for
 building sifive_u bios
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2019 07:13:47 -0000

--0000000000008c6ecf058f5972fa
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 2:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Currently the make rules are wrongly using qemu/virt opensbi image
> for sifive_u machine. Correct it.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
>  roms/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/roms/Makefile b/roms/Makefile
> index dc70fb5..775c963 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -183,7 +183,7 @@ opensbi64-sifive_u:
>         $(MAKE) -C opensbi \
>                 CROSS_COMPILE=$(riscv64_cross_prefix) \
>                 PLATFORM="qemu/sifive_u"
> -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin
> ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> +       cp opensbi/build/platform/qemu/sifive_u/firmware/fw_jump.bin
> ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>
>  clean:
>         rm -rf seabios/.config seabios/out seabios/builds
> --
> 2.7.4
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000008c6ecf058f5972fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 3, 2019 at 2:08 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently th=
e make rules are wrongly using qemu/virt opensbi image<br>
for sifive_u machine. Correct it.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
<br>
---<br>
<br>
=C2=A0roms/Makefile | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/roms/Makefile b/roms/Makefile<br>
index dc70fb5..775c963 100644<br>
--- a/roms/Makefile<br>
+++ b/roms/Makefile<br>
@@ -183,7 +183,7 @@ opensbi64-sifive_u:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C opensbi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CROSS_COMPILE=3D$(r=
iscv64_cross_prefix) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM=3D&quot;qe=
mu/sifive_u&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp opensbi/build/platform/qemu/virt/firmware/fw=
_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp opensbi/build/platform/qemu/sifive_u/firmwar=
e/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin<br>
<br>
=C2=A0clean:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf seabios/.config seabios/out seabios/buil=
ds<br>
-- <br>
2.7.4<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a>&gt;=C2=A0=C2=A0<br></div></div></div>

--0000000000008c6ecf058f5972fa--


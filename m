Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1og4w8-0003Wy-16
	for mharc-qemu-riscv@gnu.org; Wed, 05 Oct 2022 09:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <e14002270@gmail.com>)
 id 1og22D-0007jd-Is; Wed, 05 Oct 2022 06:53:53 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <e14002270@gmail.com>)
 id 1og228-0003Jq-Ba; Wed, 05 Oct 2022 06:53:51 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-35711e5a5ceso119886187b3.13; 
 Wed, 05 Oct 2022 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/b9jDzIB4jaggSCzfHz4wdD0iZ8FtFJDugL7cYa3DnE=;
 b=A/PhdLb7lxs7X+DtfdZL7M5YjFQqkcsbj1oVa5u/hiKhD7X3C7XXsi4XkfRyHlxvKn
 8OkJOhaI0ggUKx0Nkgw+Z5+6RQz1yeYvaB34lLiD88njUZyIdtnufCgxWTX2itlQQUto
 6HdHuxGMqqDOaey9j8pwT4V6YRKPgQnHpa+Xf/+Q9g7ibyAWWnEgQyIRspclsbavHkaZ
 NbrA3UfZZ90yKVW7R8vmvG/m8PTXSoscEg5D4Q7kt0qtmdl9aqp270u3RglpubDUp27F
 HDOXSWyIeR24/0OEFPHsOh4KfnaKGxTp4eVQITXRLhtbpc4dHQn+43DrYce38vzke5/K
 qq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/b9jDzIB4jaggSCzfHz4wdD0iZ8FtFJDugL7cYa3DnE=;
 b=t4psE8t/xDzJFiFrLjKmiDvE3gELhmsswCJS102aRnvBlRVK6Ij0i3wwoZ8ePuKf3f
 n5j6yWvzS8dVXWSJD12XTMPB4ffB1Xk9lFBwGc7DoVEht/MJOgdysGg6uiZabLwqUYRS
 zDnTEd5CPMNLOkXqLNqRcC4cQvD6c1kyibnhPIf4PGz4ckIN8eSc3jh7fVW+ik49Co1b
 j9jdwFwAu+A0xZHskzDDccdjzuL8Hn1T9E2rry7mRhdxz8T2wAUk71vD+bkfqXT94kym
 3sjCWMZG73X3pfs6Mx+rZBXFjNTT0Wg9R0iYU1q4p4FN5N+Lu7eKNHWu/6tTUCP3g/h/
 OsbQ==
X-Gm-Message-State: ACrzQf21tR8jje3DTSzUIUt8mxbv6ra8SBmuOycUzECspUmEp7s7Wuy+
 NJoOjwqbrdhcdkaPvQ4rAuXZ2daFMyF0Xu1Uc3M=
X-Google-Smtp-Source: AMsMyM623VnFO47BhuoKlzZwb382wlXPYJZf5XoNvi6qariViE08OisWM7EIi16F3JUdDsEksKZtDEQc/lHDg18Zau8=
X-Received: by 2002:a81:618a:0:b0:35d:1aa8:1b1c with SMTP id
 v132-20020a81618a000000b0035d1aa81b1cmr3287433ywb.140.1664967226418; Wed, 05
 Oct 2022 03:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
 <659e3df0-a384-88e0-b121-7fd7416b09a7@amsat.org>
 <5bb36d59-e112-4354-9abe-c8383002dd03.lzw194868@alibaba-inc.com>
In-Reply-To: <5bb36d59-e112-4354-9abe-c8383002dd03.lzw194868@alibaba-inc.com>
From: Eric Chan <e14002270@gmail.com>
Date: Wed, 5 Oct 2022 18:53:35 +0800
Message-ID: <CACv+nXD0guSPxPHiPBNR_r5WHjiFecZShEwxNxO_=-K1mffLqg@mail.gmail.com>
Subject: Re: Question about RISC-V brom register a1 set value
To: =?UTF-8?B?5YiY5b+X5Lyf?= <zhiwei_liu@c-sky.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000017ea7f05ea4764e2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=e14002270@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Oct 2022 09:59:46 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2022 10:53:54 -0000

--00000000000017ea7f05ea4764e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Zhiwei,

thanks for your reply, I make a mistake, t0 is 0x1000 so both
lw     a1, 32(t0) or ld     a1, 32(t0) just read from the brom offset
32byte.

Thanks,
Eric Chan

=E5=88=98=E5=BF=97=E4=BC=9F <zhiwei_liu@c-sky.com> =E6=96=BC 2022=E5=B9=B41=
0=E6=9C=885=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=
=81=93=EF=BC=9A

> I think the a1 from QEMU reset vector is the device tree(fdt_laddr) thoug=
h
> I don't know if it is directly used by the OpenSBI or just passed to the
> Linux kernel.
>
> Thanks,
> Zhiwei
>
> ------------------------------------------------------------------
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9APhilippe Mathieu-Daud=C3=A9 via <qemu=
-devel@nongnu.org>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2022=E5=B9=B410=E6=9C=883=E6=
=97=A5(=E6=98=9F=E6=9C=9F=E4=B8=80) 20:37
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9AEric Chan <e14002270@gmail.com>; qemu=
-devel <qemu-devel@nongnu.org>
> =E6=8A=84 =E9=80=81=EF=BC=9Aqemu-riscv <qemu-riscv@nongnu.org>
> =E4=B8=BB =E9=A2=98=EF=BC=9ARe: Question about RISC-V brom register a1 se=
t value
>
> Cc'ing the RISC-V specific mailing list.
>
> On 1/10/22 01:48, Eric Chan wrote:
> > Hi, qemu
> >
> > As I know, brom will pass 3 parameters to the next stage bootloader, ex=
:
> > openSBI.
> > a0 will pass hartid, a2 will pass fw_dynamic_info start address.
> > although a1 doesn't use directly in openSBI.
> > a1 read value is determined in compile time rather than read from the
> > original a1 that passes from brom.
> > In qemu/hw/riscv/boot.c
> > both 32bit and 64bit machines read 4byte that offset 32byte from the
> > brom start address.
> >
> > for 64 bits machine: a1 read low 32bit data member magic of
> fw_dynamic_info,
> > the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE because risc-v is
> > little endian.
> >
> > for 32bits machine: each data member of fw_dynamic_info is 4 bytes, so
> > a1 will read the version rather than magic.
> >
> > Do the 32bit and 64bit pass different parameters are expected?
> > If it is not expected, I guess the original version is 64bit machine,
> > and then supports 32bit but misses this detail, I hope I can have an
> > opportunity to fix this problem.
> > If it is expected, why they must be done?
> >
> > Thanks,
> > Eric Chan
> >
> > qemu/include/hw/riscv/boot_opensbi.h
> > #define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
> > qemu/hw/riscv/boot.c
> > void riscv_setup_rom_reset_vec(MachineState *machine,
> > RISCVHartArrayState *harts,
> >                                 hwaddr start_addr,
> >                                 hwaddr rom_base, hwaddr rom_size,
> > uint64_t kernel_entry,
> > uint64_t fdt_load_addr)
> > {
> > int i;
> > uint32_t start_addr_hi32 =3D 0x00000000;
> > uint32_t fdt_load_addr_hi32 =3D 0x00000000;
> >
> > if (!riscv_is_32bit(harts)) {
> >          start_addr_hi32 =3D start_addr >> 32;
> >          fdt_load_addr_hi32 =3D fdt_load_addr >> 32;
> >      }
> >      /* reset vector */
> > uint32_t reset_vec[10] =3D {
> > 0x00000297,                 /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> > 0x02828613,                 /*     addi   a2, t0, %pcrel_lo(1b) */
> > 0xf1402573,                 /*     csrr   a0, mhartid  */
> > 0,
> > 0,
> > 0x00028067,                 /*     jr     t0 */
> >          start_addr,                 /* start: .dword */
> >          start_addr_hi32,
> >          fdt_load_addr,              /* fdt_laddr: .dword */
> >          fdt_load_addr_hi32,
> >                                       /* fw_dyn: */
> >      };
> > if (riscv_is_32bit(harts)) {
> > reset_vec[3] =3D 0x0202a583;  /*     lw     a1, 32(t0) */
> > reset_vec[4] =3D 0x0182a283;  /*     lw     t0, 24(t0) */
> >      } else {
> > reset_vec[3] =3D 0x0202b583;  /*     ld     a1, 32(t0) */
> > reset_vec[4] =3D 0x0182b283;  /*     ld     t0, 24(t0) */
> >      }
> >
> >      /* copy in the reset vector in little_endian byte order */
> > for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
> > reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
> >      }
> > rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
> >                            rom_base, &address_space_memory);
> > riscv_rom_copy_firmware_info(machine, rom_base, rom_size,
> sizeof(reset_vec),
> >                                   kernel_entry);
> > }
> >
> > opensbi/firmware/fw_dynamic.S
> > fw_boot_hart:
> > /* Sanity checks */
> > li a1, FW_DYNAMIC_INFO_MAGIC_VALUE
> >          REG_L a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
> > bne a0, a1, _bad_dynamic_info
> > li a1, FW_DYNAMIC_INFO_VERSION_MAX
> >          REG_L a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
> > bgt a0, a1, _bad_dynamic_info
> >
> > /* Read boot HART id */
> > li a1, FW_DYNAMIC_INFO_VERSION_2
> > blt a0, a1, 2f
> >          REG_L a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
> > ret
> > 2: li a0, -1
> > ret
>
>
>

--00000000000017ea7f05ea4764e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0

<span style=3D"color:rgb(0,0,0);font-family:Tahoma,Arial,STHeiti,SimSun;fon=
t-size:14px">Zhiwei,</span><div><font color=3D"#000000" face=3D"Tahoma, Ari=
al, STHeiti, SimSun"><span style=3D"font-size:14px"><br></span></font><div>=
thanks for your reply, I make a mistake, t0 is 0x1000 so both=C2=A0<br>lw =
=C2=A0 =C2=A0 a1, 32(t0) or ld =C2=A0 =C2=A0 a1, 32(t0) just read from the =
brom offset 32byte.<br></div></div><div><br></div><div>Thanks,</div><div>Er=
ic Chan</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">=E5=88=98=E5=BF=97=E4=BC=9F &lt;<a href=3D"mailto:zhiwei_liu@c=
-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2022=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div st=
yle=3D"line-height:1.7;font-family:Tahoma,Arial,STHeiti,SimSun;font-size:14=
px;color:rgb(0,0,0)"><div style=3D"clear:both">I think the a1 from QEMU res=
et vector is the device tree(fdt_laddr) though I don&#39;t know if it is di=
rectly used by the OpenSBI or just passed to the Linux kernel.<br></div><di=
v style=3D"clear:both"><br></div><div style=3D"clear:both">Thanks,</div><di=
v style=3D"clear:both">Zhiwei</div><div style=3D"clear:both"><br></div><blo=
ckquote style=3D"margin-right:0px;margin-top:0px;margin-bottom:0px;font-fam=
ily:Tahoma,Arial,STHeiti,SimSun;font-size:14px;color:rgb(0,0,0)"><div style=
=3D"clear:both">-----------------------------------------------------------=
-------</div><div style=3D"clear:both">=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A=
Philippe Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qemu-devel@nongnu.org=
" target=3D"_blank">qemu-devel@nongnu.org</a>&gt;</div><div style=3D"clear:=
both">=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A2022=E5=B9=B410=E6=9C=88=
3=E6=97=A5(=E6=98=9F=E6=9C=9F=E4=B8=80) 20:37</div><div style=3D"clear:both=
">=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9AEric Chan &lt;<a href=3D"mailto:e1400=
2270@gmail.com" target=3D"_blank">e14002270@gmail.com</a>&gt;; qemu-devel &=
lt;<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@no=
ngnu.org</a>&gt;</div><div style=3D"clear:both">=E6=8A=84=E3=80=80=E9=80=81=
=EF=BC=9Aqemu-riscv &lt;<a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"=
_blank">qemu-riscv@nongnu.org</a>&gt;</div><div style=3D"clear:both">=E4=B8=
=BB=E3=80=80=E9=A2=98=EF=BC=9ARe: Question about RISC-V brom register a1 se=
t value</div><div style=3D"clear:both"><br></div>Cc&#39;ing the RISC-V spec=
ific mailing list.<br><br>On 1/10/22 01:48, Eric Chan wrote:<br>&gt; Hi, qe=
mu<br>&gt; <br>&gt; As I know, brom will pass 3 parameters to the next stag=
e bootloader, ex: <br>&gt; openSBI.<br>&gt; a0 will pass hartid, a2 will pa=
ss fw_dynamic_info start address.<br>&gt; although a1 doesn&#39;t use direc=
tly in openSBI.<br>&gt; a1 read value is determined in compile time rather =
than read from the <br>&gt; original a1 that passes from brom.<br>&gt; In q=
emu/hw/riscv/boot.c<br>&gt; both 32bit and 64bit machines read 4byte that o=
ffset 32byte from the <br>&gt; brom start address.<br>&gt; <br>&gt; for 64 =
bits machine: a1 read low 32bit data member magic of fw_dynamic_info,<br>&g=
t; the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE because risc-v is <br=
>&gt; little endian.<br>&gt; <br>&gt; for 32bits machine: each data member =
of fw_dynamic_info is 4 bytes, so <br>&gt; a1 will read the version rather =
than magic.<br>&gt; <br>&gt; Do the 32bit and 64bit pass different paramete=
rs are expected?<br>&gt; If it is not expected, I guess the original versio=
n is 64bit machine, <br>&gt; and then supports 32bit but misses this detail=
, I hope I can have an <br>&gt; opportunity to fix this problem.<br>&gt; If=
 it is expected, why they must be done?<br>&gt; <br>&gt; Thanks,<br>&gt; Er=
ic Chan<br>&gt; <br>&gt; qemu/include/hw/riscv/boot_opensbi.h<br>&gt; #defi=
ne FW_DYNAMIC_INFO_MAGIC_VALUE =C2=A0 =C2=A0 0x4942534f<br>&gt; qemu/hw/ris=
cv/boot.c<br>&gt; void riscv_setup_rom_reset_vec(MachineState *machine, <br=
>&gt; RISCVHartArrayState *harts,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 hwaddr start_addr,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwad=
dr rom_base, hwaddr rom_size,<br>&gt; uint64_t kernel_entry,<br>&gt; uint64=
_t fdt_load_addr)<br>&gt; {<br>&gt; int i;<br>&gt; uint32_t start_addr_hi32=
 =3D 0x00000000;<br>&gt; uint32_t fdt_load_addr_hi32 =3D 0x00000000;<br>&gt=
; <br>&gt; if (!riscv_is_32bit(harts)) {<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 start_addr_hi32 =3D start_addr &gt;&gt; 32;<br>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 fdt_load_addr_hi32 =3D fdt_load_addr &gt;&gt; 32;<br>&=
gt;=C2=A0 =C2=A0 =C2=A0 }<br>&gt;=C2=A0 =C2=A0 =C2=A0 /* reset vector */<br=
>&gt; uint32_t reset_vec[10] =3D {<br>&gt; 0x00000297, =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 1:=C2=A0 auipc=C2=A0 t0, %pcrel_hi(f=
w_dyn) */<br>&gt; 0x02828613, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* =C2=A0 =C2=A0 addi =C2=A0 a2, t0, %pcrel_lo(1b) */<br>&gt; 0x=
f1402573, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =C2=A0=
 =C2=A0 csrr =C2=A0 a0, mhartid=C2=A0 */<br>&gt; 0,<br>&gt; 0,<br>&gt; 0x00=
028067, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =C2=A0 =
=C2=A0 jr =C2=A0 =C2=A0 t0 */<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
rt_addr, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start: =
.dword */<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_addr_hi32,<br>&gt=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_load_addr,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* fdt_laddr: .dword */<br>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdt_load_addr_hi32,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fw_dyn: */<br>&gt;=C2=A0 =C2=A0 =C2=A0 }=
;<br>&gt; if (riscv_is_32bit(harts)) {<br>&gt; reset_vec[3] =3D 0x0202a583;=
=C2=A0 /* =C2=A0 =C2=A0 lw =C2=A0 =C2=A0 a1, 32(t0) */<br>&gt; reset_vec[4]=
 =3D 0x0182a283;=C2=A0 /* =C2=A0 =C2=A0 lw =C2=A0 =C2=A0 t0, 24(t0) */<br>&=
gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>&gt; reset_vec[3] =3D 0x0202b583;=C2=A0=
 /* =C2=A0 =C2=A0 ld =C2=A0 =C2=A0 a1, 32(t0) */<br>&gt; reset_vec[4] =3D 0=
x0182b283;=C2=A0 /* =C2=A0 =C2=A0 ld =C2=A0 =C2=A0 t0, 24(t0) */<br>&gt;=C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; <br>&gt;=C2=A0 =C2=A0 =C2=A0 /* copy in the res=
et vector in little_endian byte order */<br>&gt; for (i =3D 0; i &lt; ARRAY=
_SIZE(reset_vec); i++) {<br>&gt; reset_vec[i] =3D cpu_to_le32(reset_vec[i])=
;<br>&gt;=C2=A0 =C2=A0 =C2=A0 }<br>&gt; rom_add_blob_fixed_as(&quot;mrom.re=
set&quot;, reset_vec, sizeof(reset_vec),<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_=
base, &amp;address_space_memory);<br>&gt; riscv_rom_copy_firmware_info(mach=
ine, rom_base, rom_size, sizeof(reset_vec),<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 kernel_entry);<br>&gt; }<br>&gt; <br>&gt; opensbi/=
firmware/fw_dynamic.S<br>&gt; fw_boot_hart:<br>&gt; /* Sanity checks */<br>=
&gt; li a1, FW_DYNAMIC_INFO_MAGIC_VALUE<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 REG_L a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)<br>&gt; bne a0, a1, _bad_=
dynamic_info<br>&gt; li a1, FW_DYNAMIC_INFO_VERSION_MAX<br>&gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 REG_L a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)<br>&g=
t; bgt a0, a1, _bad_dynamic_info<br>&gt; <br>&gt; /* Read boot HART id */<b=
r>&gt; li a1, FW_DYNAMIC_INFO_VERSION_2<br>&gt; blt a0, a1, 2f<br>&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_L a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(=
a2)<br>&gt; ret<br>&gt; 2: li a0, -1<br>&gt; ret<br><br></blockquote><div s=
tyle=3D"line-height:20px;clear:both"><br></div></div></div></blockquote></d=
iv>

--00000000000017ea7f05ea4764e2--


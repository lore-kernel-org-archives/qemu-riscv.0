Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppifl-0001Bk-DS
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 00:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ppifj-0001BX-TO; Fri, 21 Apr 2023 00:46:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ppifh-0003OT-PP; Fri, 21 Apr 2023 00:46:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-506767f97f8so2026587a12.1; 
 Thu, 20 Apr 2023 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682052415; x=1684644415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lu1CKdnHGWb9AWQ/FKp6HfQM9uopYFPlJ3zgGVu738=;
 b=PeZcWKUsrIC01vDqzN5DKuW88J+06ODaFrhJwDUVAQz+Zu4wdFDicAp3+9M+LLI4X3
 VAOwg6GC1gveGKgWBb3TZvj/79t9GKG3SIB3A6PGugD2RpRwWaN71dXqojSjcvzuBaYA
 2MG41CPjy4cSqqthYjCkc8MCnw9Dv1JsXwfIlTXRnwGsLpnvsY0qizb83febMRCahdK7
 vdAFtrae0EYGJTqRFUXFxnQ1iCX6r5Ue5fgp8qphCggsmxyUDUvesW/XZ8zEsYU21fCa
 KR5Nz8OIX8dsnBEpTCpnFVUzIMMnLrOImwDAYM/6Aur16VGcqGWaX2B4bo+M+TerQGnQ
 8KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682052415; x=1684644415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lu1CKdnHGWb9AWQ/FKp6HfQM9uopYFPlJ3zgGVu738=;
 b=Sys7xX8b5JBsrcEMsgFaYKMrH4OOPwgKYKST6k4QYncRymPtEmOirSUGKNT7XkfbDk
 js0GWDXo1DeHANKIWNyRXC+gurRNJTtZA3kICazN2KOXcsc7ETGHhvpq1BR13qYb/W19
 3QPgYOxJ8Kv2S06is24JJCDaTIrOU2M7jjjVE/GaLJuXG/irrML9xk8/Q7QE/AEhzF1c
 xbMrOlLB/36d0cpCaeGk5PsG7oCfVWF1bBs3rthrIfdpQ7spfEBQiwSC4ln935x03aRB
 n1l68iz2u2kqGwe5wnmz8JTX6Z+ivJEjuyFdkX2CagRI+w342zAcH3OrvPCwwBlxMOkQ
 YxPw==
X-Gm-Message-State: AAQBX9eTo7SEPvlVqgiPJi7k656ljF/NA94dVDNm9JVtcvPZ8tuB5sYb
 GRFjowItbXL4M7sGsVQS+6UGakGxIKjVzjLEvBk=
X-Google-Smtp-Source: AKy350ZRI8C/0lLE7MT3Kj05m2Et1U8QR1AGrKBy38jWRtmdTE0W0tzgnomcOu03ZXWoligqHm/SeZloz43is32/17E=
X-Received: by 2002:a17:906:cc5b:b0:94e:ed5d:8777 with SMTP id
 mm27-20020a170906cc5b00b0094eed5d8777mr1153717ejb.25.1682052415286; Thu, 20
 Apr 2023 21:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <CAEUhbmVFgpKXESX7RtqX5Z4mU0mdbYSU+=KD1R0qPhQt-wgfYw@mail.gmail.com>
 <ZEIUueMjCCQbNbCW@sunil-laptop>
In-Reply-To: <ZEIUueMjCCQbNbCW@sunil-laptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Apr 2023 12:46:44 +0800
Message-ID: <CAEUhbmX+fyQf0QK_H0iJRB1QAufyHybt_EqkDRn8PTZ4_29v7A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 21 Apr 2023 04:47:00 -0000

On Fri, Apr 21, 2023 at 12:44=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> On Fri, Apr 21, 2023 at 12:39:46PM +0800, Bin Meng wrote:
> > On Fri, Apr 21, 2023 at 12:34=E2=80=AFPM Sunil V L <sunilvl@ventanamicr=
o.com> wrote:
> > >
> > > Currently, virt machine supports two pflash instances each with
> > > 32MB size. However, the first pflash is always assumed to
> > > contain M-mode firmware and reset vector is set to this if
> > > enabled. Hence, for S-mode payloads like EDK2, only one pflash
> > > instance is available for use. This means both code and NV variables
> > > of EDK2 will need to use the same pflash.
> > >
> > > The OS distros keep the EDK2 FW code as readonly. When non-volatile
> > > variables also need to share the same pflash, it is not possible
> > > to keep it as readonly since variables need write access.
> > >
> > > To resolve this issue, the code and NV variables need to be separated=
.
> > > But in that case we need an extra flash. Hence, modify the convention
> > > such that pflash0 will contain the M-mode FW only when "-bios none"
> > > option is used. Otherwise, pflash0 will contain the S-mode payload FW=
.
> > > This enables both pflash instances available for EDK2 use.
> > >
> > > Example usage:
> > > 1) pflash0 containing M-mode FW
> > > qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> > > or
> > > qemu-system-riscv64 -bios none \
> > > -drive file=3D<mmode_fw>,if=3Dpflash,format=3Draw,unit=3D0 -machine v=
irt
> > >
> > > 2) pflash0 containing S-mode payload like EDK2
> > > qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -mac=
hine  virt
> > > or
> > > qemu-system-riscv64 -bios <opensbi_fw> \
> > > -pflash <smode_fw_code> \
> > > -pflash <smode_vars> \
> > > -machine  virt
> > > or
> > > qemu-system-riscv64 -bios <opensbi_fw> \
> > > -drive file=3D<smode_fw_code>,if=3Dpflash,format=3Draw,unit=3D0,reado=
nly=3Don \
> > > -drive file=3D<smode_fw_vars>,if=3Dpflash,format=3Draw,unit=3D1 \
> > > -machine virt
> >
> > Please update the docs in docs/system/riscv/virt.rst to include how to
> > run EDK2 bios with these settings.
> >
> Thanks Bin. Shall I do it as a separate patch after this gets approved?
> The reason is, I need to make changes in EDK2 to work with this. Once
> EDK2 changes are also in place, will send a patch to update this
> documentation. Does it make sense?
>

Yeah, in the doc we should provide the EDK2 URL and commit that was
verified to work, so it makes sense we can add such info when EDK2 is
available.

Regards,
Bin


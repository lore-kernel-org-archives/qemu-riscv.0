Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pnCHT-0005S1-3g
	for mharc-qemu-riscv@gnu.org; Fri, 14 Apr 2023 01:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCHQ-0005Rd-44
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 01:47:28 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCHO-00078U-DE
 for qemu-riscv@nongnu.org; Fri, 14 Apr 2023 01:47:27 -0400
Received: by mail-qt1-x835.google.com with SMTP id e3so5637115qtm.12
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681451244; x=1684043244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gp4IEfmtgOUZmewdFeuGXbSFVBcCBbDalI9UfnJAhRQ=;
 b=k1VaFeiiBehvt0b4fiGRD/b1QvYDyv3ujiM1zR3Y4a+/N2RTTh2Wvuz5dBJLmZZqtG
 /s9vmBI5oew/hjsf+LWJuz9rCl9ShsTx2MZ5HjzaUChsdBcgZ1IOkFv/qdMwCfcTn8DG
 qZsvTyBgwSYZ4Pr9+qTeOVEzayO3eMg+Lj+R42uh0ep1X1Gj6iqD5Rl8cm9TCYjgRft5
 DA15DhBvu8G4rnoqS7QbrztWVc5Qyt0tFpI9fLP7U8oZq+bS2vRqgktn7x+J354S2hBE
 KGWlWQeYTETw4nxQxzxsr/BPkrSmZTlYDk4gy8IHRTC1AJ0BOl9kXz+nnHpkpEJGvKZP
 FJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681451244; x=1684043244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gp4IEfmtgOUZmewdFeuGXbSFVBcCBbDalI9UfnJAhRQ=;
 b=JpSo2Sdp5AD3OOi1xvgPY77hhdZWBCN5FpDQXNQ+VbAIFKq91cwkExuD2DUlSx7R+g
 Vupx6jb38XzPBD9ObRgoePrI2SM5nqcKqjvGb0Nz0PcvhGQIM/Fz/z4kNT/4RoKvNlYX
 W8skISu51DiEPgmFnqdXZWXAP5egiTUHaujHN3V7+ljyVjOvEINjg7PoFO/rSj3rQxSb
 7sf//uk72btZ4q4gtDKpUpbYFSQOo/SPb/s27NaayhlywJ3fgnOC9UOrsptXJeVBo1MJ
 J6l0eYpXoKFgy2aKNuAVgNDu0jTcyAG+5XRVe/98hnyEmcaZu7q/vVdkltKfP+0LyMD8
 jhbg==
X-Gm-Message-State: AAQBX9fT9i17L/2kL3p+D0bJFwGe36YB819EVs5NnKsgVdFr1H2njeC6
 GHE5RsE539P4ftMuqRQ669XEcD1Syt3ePC7K13L6xDRadbXnOVoQAbQ=
X-Google-Smtp-Source: AKy350biwafv/sIatgignLGelmelwU/Fo7w2f4Mr6xkvXMURRDIpBMklbnekOQiKe9nzrszVtLPQwRg1WrM0taarH6c=
X-Received: by 2002:a05:622a:1055:b0:3e3:8172:ff23 with SMTP id
 f21-20020a05622a105500b003e38172ff23mr1374971qte.13.1681451244659; Thu, 13
 Apr 2023 22:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-3-mchitale@ventanamicro.com>
 <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
In-Reply-To: <58021b23-dc58-bf3f-b83e-ddaa5be90e14@linaro.org>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:16:48 +0530
Message-ID: <CAN37VV4QqDJjMjaDt9GjeZweXTXQHGcTLG6VhkfWtoWkfV7h6g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] target/riscv: Add fcsr field in tb->flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Apr 2023 05:47:28 -0000

On Tue, Apr 11, 2023 at 7:17=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/10/23 07:13, Mayuresh Chitale wrote:
> > The state of smstateen0.FCSR bit impacts the execution of floating poin=
t
> > instructions when misa.F=3D=3D0. Add a field in the tb->flags which sto=
res
> > the current state of smstateen0.fcsr and will be used by floating point
> > translation routines.
>
> Are you certain that you require a new bit?
>
> Could the same effect be achieved by forcing one or more of the existing
> TB_FLAGS.{FS,HS_FS} fields to 0 within cpu_get_tb_cpu_state?  I.e. for th=
e purposes of
> translation, pretend the FS state is DISABLED?
Yes, that is correct.
>
> These bits are scarce, are we are nearly out.
>
>
> r~
>


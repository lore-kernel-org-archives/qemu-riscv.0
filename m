Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pukjv-00042O-DC
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 22:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pukjs-00040S-NP; Thu, 04 May 2023 22:00:04 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pukjq-0005T2-S5; Thu, 04 May 2023 22:00:04 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-77a8cc70fdeso363049241.2; 
 Thu, 04 May 2023 19:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683252001; x=1685844001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVpi7jnCVd+unREPe7fGXXKh5SiuutFp7mwd8hlQs6U=;
 b=fTe7gi0JAizNZLoB7Djhcno5HSfrxg44SzO3Imd1MiOLEaEykZi9BFMOPh2t2Rzl8W
 haA1aW109X1UwG1lDz0xjURh8oTQw5jpRu4yaMtqm0fZ9RBRPdVjm3kGmwIyCGZHbF8t
 P4TPt6VVok/fyWeUpfy5rYRSXCSufsLvBOaZfmH66a3LbzGwhnVR7NgbtX5Gb7TegxGB
 3+X01mdSPoPGELvfnbSq5djrRRG3EDKm6p/CR710NdMRyBoU/+w8NR3Ew+z6aR8eGc7S
 9t1DRdP4jxfMaUrPA4V6prFPpLLi/iHgRMtLJXVDV6JXD3Vk2E9dhH0Crb9ab8AWfMRI
 RFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683252001; x=1685844001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVpi7jnCVd+unREPe7fGXXKh5SiuutFp7mwd8hlQs6U=;
 b=VxDpKafUxS+70VPOkQ6ftAS49TEpVHh3rYoyL8YzRj8MOXKnZM60jV2RVMtba+Bd5L
 bqHjiHkuGSrMUr0s3OnBaE29Hqh2GTnoXtYjz12C8zIg3ZCbROKPpRf5x3aHFVBH6bYq
 ltw3Sbe5lCLy0jy/5CSPn/wy6DSD4E5s2smpcBQ6P12sbTbT/rvoFMohk4/GLGYcuTCW
 0aFALd/9tz/Znm2CglQeOgx967sgY9kmBWWbDalxEdaf7TTM6sCaykjxsURNtxT625Qg
 mSiFDmXRRwQVudBARVFlsLM/sk41KhR6iBBjMEBXIsuqsNYcFnmTGlGCrRwNFVNEIw15
 U5yg==
X-Gm-Message-State: AC+VfDzqZCWTENz8aEURilbFBDsQICOWi3V/blvSiiewjEg4BT8G0gfK
 UCq+q2TA++JOHUA7a0nqKerkQ8JBbJFrC78chWs=
X-Google-Smtp-Source: ACHHUZ5cfJbyz8nXiLHTSk1ag7OpP5C4HJtFGwkcH/djMCooUXbL7AToeNLFF6/YiShMMGisB8J903EYjXXnG69IZek=
X-Received: by 2002:a05:6102:143:b0:434:413a:151b with SMTP id
 a3-20020a056102014300b00434413a151bmr35705vsr.15.1683252000523; Thu, 04 May
 2023 19:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <CAKmqyKMhA5=f99rzxp63-vqiUCZwEuWmAZK76=ZKUrni-CTauQ@mail.gmail.com>
 <6946d44f-8b24-de00-7efc-e35d48f62705@ventanamicro.com>
In-Reply-To: <6946d44f-8b24-de00-7efc-e35d48f62705@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 May 2023 11:59:34 +1000
Message-ID: <CAKmqyKOUHKsK27=1PvQr-xM5vMvZ5hj_EzBeeXr-xQ3tdNhw1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: implement query-cpu-definitions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 05 May 2023 02:00:05 -0000

On Wed, May 3, 2023 at 7:51=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Alistair,
>
> Patch 2 has a typo right in the commit title:
>
> "target/riscv: add query-cpy-definitions support"
>
> it should be 'query-cpu-definitions'. Can you amend it in the tree? Or sh=
ould
> I re-send?

I have fixed it in my tree, so no need to resend.

I did already send the PR though. I don't think it's worth re-sending
a v2 PR for the typo

Alistair

>
>
>
> Thanks,
>
>
> Daniel
>
>
>
> On 4/16/23 23:58, Alistair Francis wrote:
> > On Wed, Apr 12, 2023 at 4:36=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> Hi,
> >>
> >> In this v3 I removed patches 3 and 4 of v2.
> >>
> >> Patch 3 now implements a new type that the generic CPUs (any, rv32,
> >> rv64, x-rv128) were converted to. This type will be used by
> >> query-cpu-definitions to determine if a given cpu is static or not bas=
ed
> >> on its type. This approach was suggested by Richard Henderson in the v=
2
> >> review.
> >>
> >> Patches are based on top of Alistair's riscv-to-apply.next.
> >>
> >> Changes from v2:
> >> - old patches 3 and 4: removed
> >> - patch 3:
> >>    - add TYPE_RISCV_DYNAMIC_CPU
> >>    - use this type to set 'q_static' in riscv_cpu_add_definition()
> >> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01=
310.html
> >>
> >> Daniel Henrique Barboza (3):
> >>    target/riscv: add CPU QOM header
> >>    target/riscv: add query-cpy-definitions support
> >>    target/riscv: add TYPE_RISCV_DYNAMIC_CPU
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
> >
> > Alistair
> >
> >>
> >>   qapi/machine-target.json      |  6 ++-
> >>   target/riscv/cpu-qom.h        | 70 +++++++++++++++++++++++++++++++++=
++
> >>   target/riscv/cpu.c            | 20 ++++++++--
> >>   target/riscv/cpu.h            | 46 +----------------------
> >>   target/riscv/meson.build      |  3 +-
> >>   target/riscv/riscv-qmp-cmds.c | 57 ++++++++++++++++++++++++++++
> >>   6 files changed, 150 insertions(+), 52 deletions(-)
> >>   create mode 100644 target/riscv/cpu-qom.h
> >>   create mode 100644 target/riscv/riscv-qmp-cmds.c
> >>
> >> --
> >> 2.39.2
> >>
> >>


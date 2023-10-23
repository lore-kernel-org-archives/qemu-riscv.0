Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A3CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 03:01:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qulC9-0003UD-Gf; Sun, 22 Oct 2023 23:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulC7-0003TT-6Z; Sun, 22 Oct 2023 23:01:31 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulC5-0008Ow-9L; Sun, 22 Oct 2023 23:01:30 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4a8158e8613so1143204e0c.3; 
 Sun, 22 Oct 2023 20:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698030088; x=1698634888; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knQoWeGR7b2Ctgu87wqWxobRWfPB9rMktSOsqOPVdJI=;
 b=R/WheOzMfdFuZ7MyisJZA8Z0p3+wBleuoqniEbV7Rq8plNcz1RvzqJirjuWjdk8MDz
 i94o9YGfj18ycUK2ZsAx2qgVcuG0BPlHTT18zmnpIl3oLPlea+AN52gvl3QEOcixaUyD
 2bEA7YWvYP62ETmchNxFelDWtguCn36l/gZHYydiKB0B4hLN/DDrMN6CNgOup55DFWf6
 RrOUgflXn+LQyo054UiornzAhuI/lLMxv/XbJEIy8Asqbx6t3iPwY2QufGlQaBMC3FAZ
 yu6biDZ/km4ZuGlTAFObkzcwkltkq3+ZR0hVSfrg166FXx8tlYtzqGP/QQ3JO1ZjUeNO
 9Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698030088; x=1698634888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knQoWeGR7b2Ctgu87wqWxobRWfPB9rMktSOsqOPVdJI=;
 b=RsZqYw4xMZGReMTYre2FqktTQyScgBTyU0r2thLaO6vXCWeGuTjYtNw/4Y0V/xvPzW
 033Ae+YoPrtMgB0P/INXNUCEK++O9bp393JcjnFYCVYTCyheaomDOG9h+JifmOsKdZk0
 TVSc0srDJmH5yZJRVnyOi7h1J62Cg019gwZvhZC4m+2i4L+ePSlaEgZAWipWdGrhxXvv
 f0MHPcVbbuR2AcW/FaQoTR64FZR5RpAZsfdhjUxe8jMEnoaxc8rqnBCzCxB1k5JmY9KQ
 ZCUE0uOnfzCEIAkp8Mg9hCTHkBergvl0PEi+UMONMuW5+RzZvn/izPVRX/RN8HNZ/Fmk
 1GzQ==
X-Gm-Message-State: AOJu0YwtC/EkABsf3kjlLMquf4v3ioZe6LQxPtaTXAV0p17Grvd2QO4m
 3dENvJoC1kfVElmtTCpt4v+Mb3sLUjpM3TAjgus=
X-Google-Smtp-Source: AGHT+IG4YS0+jYCo1L0QgvFEwinQbnF8CiKdv+aUh4wjL4tkctnHzZXgrPIbApcIeWdDVAIVzCZhNaiJAagSyCMp1ok=
X-Received: by 2002:a67:e013:0:b0:457:b9da:db12 with SMTP id
 c19-20020a67e013000000b00457b9dadb12mr6682080vsl.12.1698030087831; Sun, 22
 Oct 2023 20:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231018195638.211151-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231018195638.211151-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 13:00:00 +1000
Message-ID: <CAKmqyKO4ac=OycEDuQv4PZc6+K2s73e=NhVCNbKenhSpeU1YGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] riscv: query-cpu-model-expansion API
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 19, 2023 at 7:05=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This is a re-send of v2 after fixing a trivial conflict with Alistair's
> riscv-to-apply.next.
>
> No other changes made. All patches acked.
>
> Changes from v2:
> - rebased with Alistair's riscv-to-apply.next
> - v2 link: https://lore.kernel.org/qemu-riscv/20230926184019.166352-1-dba=
rboza@ventanamicro.com/
>
>
> --- API usage examples ---
>
> Launch QEMU with "-S" to be able to issue QMP query commands before the m=
achine starts:
>
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp  tcp:localhos=
t:1234,server,wait=3Doff
>
> Then use QMP to access the API:
>
> $ ./scripts/qmp/qmp-shell localhost:1234
> Welcome to the QMP low-level shell!
> Connected to QEMU 8.1.50
>
> - Query the default attributes for the 'rv64' CPU:
>
> (QEMU)  query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
> {"return": {"model": {"name": "rv64", "props": {"zicond": false, "x-zvfh"=
: false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs":=
 false, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smsta=
teen": false, "zfinx": false, "Zve64f": false, "Zve32f": false, "x-zvfhmin"=
: false, "xventanacondops": false, "xtheadcondmov": false, "svpbmt": false,=
 "zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": true, "xthea=
dmac": false, "Zfh": false, "Zfa": true, "zbkx": false, "zbkc": false, "zbk=
b": false, "Zve64d": false, "x-zfbfmin": false, "zk": false, "x-epmp": fals=
e, "xtheadmempair": false, "zkt": false, "zks": false, "zkr": false, "zkn":=
 false, "Zfhmin": false, "zksh": false, "zknh": false, "zkne": false, "zknd=
": false, "zhinx": false, "Zicsr": true, "sscofpmf": false, "Zihintntl": tr=
ue, "sstc": true, "xtheadcmo": false, "x-zvbb": false, "zksed": false, "x-z=
vkned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "sv=
adu": true, "xtheadfmv": false, "x-zvksed": false, "svnapot": false, "pmp":=
 true, "x-zvknhb": false, "x-zvknha": false, "xtheadfmemidx": false, "x-zvk=
sh": false, "zdinx": false, "zicbom": true, "Zihintpause": true, "svinval":=
 false, "zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": fals=
e, "x-ssaia": false, "x-smaia": false, "zmmul": false, "x-zvbc": false, "Zi=
fencei": true, "zcmt": false, "zcmp": false, "Zawrs": true}}}}
>
> - Query if the 'rv64' CPU with g=3Dtrue,zifencei=3Dfalse is a valid expan=
sion:
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64","prop=
s":{"g":true,"zifencei":false}}
> {"error": {"class": "GenericError", "desc": "RVG requires Zifencei but us=
er set Zifencei to false"}}
>
> - Query a model expansion for the 'rv64' CPU with RVV enabled:
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max","props=
":{"v":true}}
> {"return": {"model": {"name": "max", "props": {"zicond": true, "x-zvfh": =
false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs": f=
alse, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smstate=
en": true, "zfinx": false, "x-zvfhmin": false, "zfhmin": true, "xventanacon=
dops": false, "zicsr": true, "xtheadcondmov": false, "zihintntl": true, "sv=
pbmt": true, "zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": =
true, "xtheadmac": false, "zbkx": true, "zbkc": true, "zbkb": true, "x-zfbf=
min": false, "zk": true, "x-epmp": false, "xtheadmempair": false, "zkt": tr=
ue, "zks": true, "zkr": true, "zkn": true, "zksh": true, "zknh": true, "zkn=
e": true, "zknd": true, "zhinx": false, "sscofpmf": true, "sstc": true, "zi=
hintpause": true, "xtheadcmo": false, "x-zvbb": false, "zksed": true, "x-zv=
kned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "zif=
encei": true, "svadu": true, "xtheadfmv": false, "x-zvksed": false, "zawrs"=
: true, "svnapot": true, "pmp": true, "x-zvknhb": false, "x-zvknha": false,=
 "xtheadfmemidx": false, "x-zvksh": false, "zdinx": false, "zicbom": true, =
"zve64f": true, "zve32f": true, "svinval": true, "zcf": false, "zce": false=
, "zcd": true, "zcb": true, "zca": true, "x-ssaia": false, "x-smaia": false=
, "zmmul": true, "x-zvbc": false, "zfh": true, "zfa": true, "zcmt": false, =
"zcmp": false, "zve64d": true}}}}
>
> - Querying vendor CPUs is also supported:
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"veyron-v1"}
> {"return": {"model": {"name": "veyron-v1", "props": {"zicond": false, "x-=
zvfh": false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xthea=
dbs": false, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "=
smstateen": true, "zfinx": false, "x-zvfhmin": false, "zfhmin": false, "xve=
ntanacondops": true, "zicsr": true, "xtheadcondmov": false, "zihintntl": fa=
lse, "svpbmt": true, "zbs": true, "zbc": true, "zbb": true, "zba": true, "z=
icboz": true, "xtheadmac": false, "zbkx": false, "zbkc": false, "zbkb": fal=
se, "x-zfbfmin": false, "zk": false, "x-epmp": false, "xtheadmempair": fals=
e, "zkt": false, "zks": false, "zkr": false, "zkn": false, "zksh": false, "=
zknh": false, "zkne": false, "zknd": false, "zhinx": false, "sscofpmf": tru=
e, "sstc": true, "zihintpause": false, "xtheadcmo": false, "x-zvbb": false,=
 "zksed": false, "x-zvkned": false, "xtheadsync": false, "x-zvkg": false, "=
zhinxmin": false, "zifencei": true, "svadu": false, "xtheadfmv": false, "x-=
zvksed": false, "zawrs": false, "svnapot": true, "pmp": true, "x-zvknhb": f=
alse, "x-zvknha": false, "xtheadfmemidx": false, "x-zvksh": false, "zdinx":=
 false, "zicbom": true, "zve64f": false, "zve32f": false, "svinval": true, =
"zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": false, "x-ss=
aia": true, "x-smaia": true, "zmmul": false, "x-zvbc": false, "zfh": false,=
 "zfa": false, "zcmt": false, "zcmp": false, "zve64d": false}}}}
>
>
> Daniel Henrique Barboza (6):
>   target/riscv/kvm/kvm-cpu.c: add missing property getters()
>   qapi,risc-v: add query-cpu-model-expansion
>   target/riscv/tcg: add tcg_cpu_finalize_features()
>   target/riscv: handle custom props in qmp_query_cpu_model_expansion
>   target/riscv: add riscv_cpu_accelerator_compatible()
>   target/riscv/riscv-qmp-cmds.c: check CPU accel in
>     query-cpu-model-expansion

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  qapi/machine-target.json      |   6 +-
>  target/riscv/cpu.c            |  27 +++++-
>  target/riscv/cpu.h            |   2 +
>  target/riscv/kvm/kvm-cpu.c    |  40 ++++++++-
>  target/riscv/riscv-qmp-cmds.c | 160 ++++++++++++++++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c    |  70 +++++++++------
>  target/riscv/tcg/tcg-cpu.h    |   2 +
>  7 files changed, 271 insertions(+), 36 deletions(-)
>
> --
> 2.41.0
>
>


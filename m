Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE74C41513
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtCew-0003nv-Vj; Wed, 18 Oct 2023 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCev-0003nc-KI
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCes-0001bB-O5
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-27d538a73d6so2971295a91.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697659005; x=1698263805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0U0h47ed9aqq29AwXxgL4pFz61S6vxpcU2ZygRbh6SI=;
 b=kxGtmi9iE7b2VPm8v1KGeMeJ7van7cp+GFNUz1iY2vYWXIKd1WcUwMn0vishMFON0d
 C5hItYPkBJmE2hAuhPFlPnCfpiuSGeqCRNymNLCMFsATsx5zDphOvaiJaC0hkwQehAMu
 a/x72MspQ/gRon3l2aCaTwvlbKx0UW4VNamJ8VU1h8Dbwy7HFMs0/js/5iRkhdetd3VI
 8PeJmX39F6Hv8u1nrJXd5qlW7yAvqeqiwKb+azMxk8NXCbeWwf5kI+xxxyl4Evf5+QSI
 oBHKiV2YRivQN7T78fQlI1AlPf52DtxPAcSg9BDJukrG14teHG7hpH85bbpQOtpOwyme
 5tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659005; x=1698263805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0U0h47ed9aqq29AwXxgL4pFz61S6vxpcU2ZygRbh6SI=;
 b=u3V3H86qLXwTsXrG5T+Gzi5tOXNggLEiG7ut97NHL5BOWWlhf2w0DUGGPosdUzrKur
 UUHmXROgDAi+Ek253E28suc9hH6cZ5xdGOurgD06rnZ5wBgDSj3S825LgYiN3INQcWu+
 qFGPEe9qoU3YPB4gEfMA+ZdRR2RBQ4MhYriPtxgEZMRLQIzTUgmEfHdDzo9jHGJE2U1W
 uDKieu+UyOrLT8CI7FtuSsppif+7NUsktYQvr08dv/md5QW3S6FxnHrEjE6IDqonrCYJ
 3s2w9j5uGqHy7BsnvR5hjMJ+h4D+JxbTOJz/LfDReQnIOfjfFfeJkkW9hdD0lCQTQZjw
 gaGQ==
X-Gm-Message-State: AOJu0YyDt5rhTjzzEXuFwfE2cC2a4l8qBIXkejeZCsDDCTDppuPTFLMB
 6QKThuPvX3A9pnlkgSSUqSxnvA==
X-Google-Smtp-Source: AGHT+IEEt0AyMc4db6SuXt5An+1Voyoyt2a284S2YTjTeahgvgESGhRoITiSDDLvAHVxXO9S+8oBxw==
X-Received: by 2002:a17:90b:198f:b0:27d:5be:f218 with SMTP id
 mv15-20020a17090b198f00b0027d05bef218mr194061pjb.23.1697659005004; 
 Wed, 18 Oct 2023 12:56:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b00268b439a0cbsm256359pjb.23.2023.10.18.12.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:56:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/6] riscv: query-cpu-model-expansion API
Date: Wed, 18 Oct 2023 16:56:32 -0300
Message-ID: <20231018195638.211151-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

This is a re-send of v2 after fixing a trivial conflict with Alistair's
riscv-to-apply.next.

No other changes made. All patches acked.

Changes from v2:
- rebased with Alistair's riscv-to-apply.next
- v2 link: https://lore.kernel.org/qemu-riscv/20230926184019.166352-1-dbarb=
oza@ventanamicro.com/


--- API usage examples ---

Launch QEMU with "-S" to be able to issue QMP query commands before the mac=
hine starts:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp  tcp:localhost:=
1234,server,wait=3Doff

Then use QMP to access the API:

$ ./scripts/qmp/qmp-shell localhost:1234
Welcome to the QMP low-level shell!
Connected to QEMU 8.1.50

- Query the default attributes for the 'rv64' CPU:

(QEMU)  query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
{"return": {"model": {"name": "rv64", "props": {"zicond": false, "x-zvfh": =
false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs": f=
alse, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smstate=
en": false, "zfinx": false, "Zve64f": false, "Zve32f": false, "x-zvfhmin": =
false, "xventanacondops": false, "xtheadcondmov": false, "svpbmt": false, "=
zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": true, "xtheadm=
ac": false, "Zfh": false, "Zfa": true, "zbkx": false, "zbkc": false, "zbkb"=
: false, "Zve64d": false, "x-zfbfmin": false, "zk": false, "x-epmp": false,=
 "xtheadmempair": false, "zkt": false, "zks": false, "zkr": false, "zkn": f=
alse, "Zfhmin": false, "zksh": false, "zknh": false, "zkne": false, "zknd":=
 false, "zhinx": false, "Zicsr": true, "sscofpmf": false, "Zihintntl": true=
, "sstc": true, "xtheadcmo": false, "x-zvbb": false, "zksed": false, "x-zvk=
ned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "svad=
u": true, "xtheadfmv": false, "x-zvksed": false, "svnapot": false, "pmp": t=
rue, "x-zvknhb": false, "x-zvknha": false, "xtheadfmemidx": false, "x-zvksh=
": false, "zdinx": false, "zicbom": true, "Zihintpause": true, "svinval": f=
alse, "zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": false,=
 "x-ssaia": false, "x-smaia": false, "zmmul": false, "x-zvbc": false, "Zife=
ncei": true, "zcmt": false, "zcmp": false, "Zawrs": true}}}}

- Query if the 'rv64' CPU with g=3Dtrue,zifencei=3Dfalse is a valid expansi=
on:

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64","props"=
:{"g":true,"zifencei":false}}
{"error": {"class": "GenericError", "desc": "RVG requires Zifencei but user=
 set Zifencei to false"}}

- Query a model expansion for the 'rv64' CPU with RVV enabled:

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max","props":=
{"v":true}}
{"return": {"model": {"name": "max", "props": {"zicond": true, "x-zvfh": fa=
lse, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs": fal=
se, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smstateen=
": true, "zfinx": false, "x-zvfhmin": false, "zfhmin": true, "xventanacondo=
ps": false, "zicsr": true, "xtheadcondmov": false, "zihintntl": true, "svpb=
mt": true, "zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": tr=
ue, "xtheadmac": false, "zbkx": true, "zbkc": true, "zbkb": true, "x-zfbfmi=
n": false, "zk": true, "x-epmp": false, "xtheadmempair": false, "zkt": true=
, "zks": true, "zkr": true, "zkn": true, "zksh": true, "zknh": true, "zkne"=
: true, "zknd": true, "zhinx": false, "sscofpmf": true, "sstc": true, "zihi=
ntpause": true, "xtheadcmo": false, "x-zvbb": false, "zksed": true, "x-zvkn=
ed": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "zifen=
cei": true, "svadu": true, "xtheadfmv": false, "x-zvksed": false, "zawrs": =
true, "svnapot": true, "pmp": true, "x-zvknhb": false, "x-zvknha": false, "=
xtheadfmemidx": false, "x-zvksh": false, "zdinx": false, "zicbom": true, "z=
ve64f": true, "zve32f": true, "svinval": true, "zcf": false, "zce": false, =
"zcd": true, "zcb": true, "zca": true, "x-ssaia": false, "x-smaia": false, =
"zmmul": true, "x-zvbc": false, "zfh": true, "zfa": true, "zcmt": false, "z=
cmp": false, "zve64d": true}}}}

- Querying vendor CPUs is also supported:

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"veyron-v1"}
{"return": {"model": {"name": "veyron-v1", "props": {"zicond": false, "x-zv=
fh": false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadb=
s": false, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "sm=
stateen": true, "zfinx": false, "x-zvfhmin": false, "zfhmin": false, "xvent=
anacondops": true, "zicsr": true, "xtheadcondmov": false, "zihintntl": fals=
e, "svpbmt": true, "zbs": true, "zbc": true, "zbb": true, "zba": true, "zic=
boz": true, "xtheadmac": false, "zbkx": false, "zbkc": false, "zbkb": false=
, "x-zfbfmin": false, "zk": false, "x-epmp": false, "xtheadmempair": false,=
 "zkt": false, "zks": false, "zkr": false, "zkn": false, "zksh": false, "zk=
nh": false, "zkne": false, "zknd": false, "zhinx": false, "sscofpmf": true,=
 "sstc": true, "zihintpause": false, "xtheadcmo": false, "x-zvbb": false, "=
zksed": false, "x-zvkned": false, "xtheadsync": false, "x-zvkg": false, "zh=
inxmin": false, "zifencei": true, "svadu": false, "xtheadfmv": false, "x-zv=
ksed": false, "zawrs": false, "svnapot": true, "pmp": true, "x-zvknhb": fal=
se, "x-zvknha": false, "xtheadfmemidx": false, "x-zvksh": false, "zdinx": f=
alse, "zicbom": true, "zve64f": false, "zve32f": false, "svinval": true, "z=
cf": false, "zce": false, "zcd": false, "zcb": false, "zca": false, "x-ssai=
a": true, "x-smaia": true, "zmmul": false, "x-zvbc": false, "zfh": false, "=
zfa": false, "zcmt": false, "zcmp": false, "zve64d": false}}}}


Daniel Henrique Barboza (6):
  target/riscv/kvm/kvm-cpu.c: add missing property getters()
  qapi,risc-v: add query-cpu-model-expansion
  target/riscv/tcg: add tcg_cpu_finalize_features()
  target/riscv: handle custom props in qmp_query_cpu_model_expansion
  target/riscv: add riscv_cpu_accelerator_compatible()
  target/riscv/riscv-qmp-cmds.c: check CPU accel in
    query-cpu-model-expansion

 qapi/machine-target.json      |   6 +-
 target/riscv/cpu.c            |  27 +++++-
 target/riscv/cpu.h            |   2 +
 target/riscv/kvm/kvm-cpu.c    |  40 ++++++++-
 target/riscv/riscv-qmp-cmds.c | 160 ++++++++++++++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c    |  70 +++++++++------
 target/riscv/tcg/tcg-cpu.h    |   2 +
 7 files changed, 271 insertions(+), 36 deletions(-)

--=20
2.41.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BA0C624A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 14:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x12iQ-0003GV-FM; Mon, 31 Aug 2026 10:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12iO-000395-DO
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12iH-0006ca-JL
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:20 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VB9wMi3447045
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=kKVhsq0aXEJmMHeamjodVlIHhvVX8Bp34V2
 tQ4/PTeM=; b=HsZzlUdGJHc6mijlT19ccunC3Y03E/6eYp25RW/ImYVcifJef5Q
 KBBP8mawRPZKu96JDkgmuFYPRDqH6zx3wM3ggRauFbcQBQk4+Jf85MZdemkKHEap
 dBg+hclKGngESud7EKgtZVhGaa2/tbmQwHuc6xPfygtUPW8hb+sxGkvLFqSTi2BK
 HE1dS24E23eTz77MWxbzb0+tmLvKQe9rI+mEcVx3EHa8/Afmgbwli1V9oWJ4IgdT
 Lonv639PoLGzRqXgsN+jotTooGbg2iapBdHEsWNeCMJZcfECK1mP7Qd9HBKyEX48
 TUYgOIfo2UXoawj32PGVXHlUIMlyysL4vMg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb967m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:14 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-4412c255fd4so6232381fac.3
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788185413; x=1788790213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kKVhsq0aXEJmMHeamjodVlIHhvVX8Bp34V2tQ4/PTeM=;
 b=b6WgloMUgGhjK7QUQnBb8eXQ5S55YEficaR/lnyZoW6dffD3zqzP5TpKUAgXMtP1VS
 NeA865vt9F1PlmIVZKUKaXRFPnDKjfk752gu6dlJD0DNFU07PbqmqiLZ9k21xYuLK1cD
 3dowcAwnUaz4o5fgpxIOCMqspQD+xbndxxa2fW07Bv3xATivhATql7hGxAqG691hzCK9
 b4ZnpDkXJgkWfyI1a3uP0vn/cu709uWkJUsEIVtCi+Vd/Q7CXfAExYetRTFmWj5t27Fe
 +dYdBGul60cM0tCoQ3fnNA2p0+p5k/mRT+MZWSUZ8PsCWXBRRIYEdr2AR4VyzGJ6Zd7h
 2eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788185413; x=1788790213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kKVhsq0aXEJmMHeamjodVlIHhvVX8Bp34V2tQ4/PTeM=;
 b=p4IGlwl/MWE9bbfS9DaZAqnfOoLk5KykS5FppmG86pzDmvYg6fhnHawoCkoBr8CM7d
 0g1zZFRehLlww4+BZV8KAUgZJRMj8Jvi6U/v0P6NkS9svVpioNsDurxsadkXSjMD1NYZ
 xVAK/WgO32LJ59My3pCv5RVKAJa+0OE9qT9yuUAZJxDZOWcGRGuKLuTDgaPwjszSyHQq
 NBGwvDeC5hPQ1fbqeOprXC7ft03llNXNo34dJH68kLOZlzj/DSi7iZXbRKDFYfOqXJQW
 ytziApanXr5pOGKgyCG/IncG5P5aUWYr1x9Cwb9NjFQk2oCDzMdE7dCgdNPN2iGJsJJC
 KrTA==
X-Gm-Message-State: AFuF++m6F06tV0OLElvtO2AHp1XjWdXLflDgjEENTO5/5+e5DEsdtQlc
 zvsgGZKYDfwhfTtGhqk4766yI9VU0fTrTQoei8MH1JZVR1XEcyGdiA7bPi78TBGgYmFBrIMED7G
 OjQJiESu0n7JCvBKm1j1lnckciAlf4yRu6agg61Eb0855JxHrraN3JSPZ+w==
X-Gm-Gg: AR+sD108N5pCSW6oWjigDwenBrsUsxGCc/xRtqWbYF8ixPHlyLw0UZ/ci5wgsiAw/V7
 L/QwmzqpacYUFbu5iLyK+ro2+NUD+GqymAWIAB6u2K7uwY1cfvFRHM0cQG7U0+qT9W6yJkM+IW/
 TF9K+nHC49AS77h3b0vA5yN2YMGWdsIP8dch8W1+LezVIr8vlw+4DejgS/7as6zKMP/WF8T3afQ
 bNPV6De/En27rmLj/VSTyXHNkKBD2Sr4L0ovnK4I2+IdRFfS/ocFC9VLlhDy9LcK9sS1sJKap42
 ATXUKn/plmn/SSEiJj1kzhykPf/muNLHzI7PHIqMOAFHar7Y2sz7TKVdbYwgWa7a6zUozmhfvqZ
 GLwX/2127W7pXNYWOVa+NxsFN/ImInFDZBHeXmQ==
X-Received: by 2002:a05:6870:c98a:b0:448:71f4:a28 with SMTP id
 586e51a60fabf-46af537b000mr1197543fac.2.1788185413117; 
 Mon, 31 Aug 2026 07:10:13 -0700 (PDT)
X-Received: by 2002:a05:6870:c98a:b0:448:71f4:a28 with SMTP id
 586e51a60fabf-46af537b000mr1197435fac.2.1788185412364; 
 Mon, 31 Aug 2026 07:10:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-468a3535e25sm9886129fac.5.2026.08.31.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 07:10:11 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v7 0/7] riscv: add initial sdext support
Date: Mon, 31 Aug 2026 11:09:59 -0300
Message-ID: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Bq9Xnp1dyuI1Z8O1nvc5Bmt5rREmrbOO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX7rplvEd0266J
 pxHA9J7dOUFgpZNST30bpvxS/TJ2I4NsIliM7FaSijZp2T9Ne6gebFKkBglATGYnnIIjPgwyqTI
 uCf7iuGVZyHlLw+yIEcq93Zj/m5fFFbB+s47132y1VZ06XDzZaUDdj4vgFlLqoy6iSPn/cdgwD7
 DcODBOG5WC3WOn3DM3m3NSw+UHUnolIb7O0DN3sttHn8JiRe5dC/5WXpwn6XiYoFKVs1uuQCNdE
 KOGsIhq5kAHrvHjsHsA6P+ZrzXHZT1SFi4LibabeMCuMcbPXRJE24/bHBR2a4oxoWqQG2OCcr4W
 C56z6awPb85apkCBnzC1pROfTFdW6oxtywtBRlheHFuwK+LKVMfnxulQJpB7Cz2NC8awgD4o6Qy
 H4HANdMjyvK7zFKbCu3vhPqDknfxPaDTDYNBaH+DcXpNS4rPziL1D2fIMjBVxHzNJKn5lQAIGDw
 rNheEXUEXUhi1g3evuQ==
X-Proofpoint-GUID: Bq9Xnp1dyuI1Z8O1nvc5Bmt5rREmrbOO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX+mnh/aipT//V
 c4pw1gbnIA3+uSAFHyH/nV4NUCBr1q4ccwxbLOaQZDQ60r6yrCEhUz6OhzqnCxNlCIDp1cj+YCK
 4Xoa+qyn0dullZqmtUlEsslks+aR9JU=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a958b46 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=xvfqbYfxAAAA:20 a=pFyQfRViAAAA:8
 a=p0WdMEafAAAA:8 a=7QAV9UKVwuH8uxJJLZ4A:9 a=y8BKWJGFn5sdPF1Y92-H:22
 a=oJz5jJLG1JtSoe7EL652:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hello,

This version of sdext contains no relevant changes in its base code,
patches 1-6 (former patches 2-7), all of them developed by Chao Lui
and all of them already reviewed.

The most significant changes are:

- former patch 1 (target/riscv: deprecate 'debug' CPU property) was
  removed.

- a new rebase with alistair/riscv-to-apply.next.  The most important
  bit is the rebase with the new Debug 0.13/1.0 code that landed in
  Alistair's branch.  Although no code changes were required in sdext,
  we're now running in the intended modernized 'sdtrig' base.

- a new TCG test case.  Chao, there's a high chance I messed up and
  maybe there's more we can test with TCG right now.  Let me know if I
  missed something.


This series, along with

"[PATCH v5 00/15] hw/riscv: trivial code dup work (riscv-server-ref prep)"

Are the last dependencies for the RISC-V Server Platform
(riscv-server-ref) board.  As soon as both are queued I'll send the v9.



Patches based on alistair/riscv-to-apply.next.  Only patch 7 missing
reviews/acks.



Changes in v7:
- former patch 1: dropped;
- rebased on top of latest alistair/riscv-to-apply.next and the now
  modernized Debug 1.0 support;
- patch 7 (new):
  - add TCG test coverage for illegal insn outside of Debug mode.
- v6 link: https://lore.kernel.org/qemu-devel/cover.1775959096.git.chao.liu.zevorn@gmail.com/


----------------------------
Original cover letter/series change history:


The implementation follows RISC-V Debug Specification 1.0 [2].

It introduces the sdext/sdtrig config bits, DCSR/DPC/DSCRATCH state,
Debug Mode enter/leave helpers, DRET, EBREAK entry, single-step, and
trigger action=debug mode.

To reduce review load, this series focuses on the Sdext features first.
The Debug Module (DM) and related flows will follow in a later series.


Changes in v6:
- Rebased onto latest riscv-to-apply.next

Changes in v5:
- Patch 2: removed redundant `cpu->cfg.ext_sdext = false;` in
  riscv_cpu_init() since it's already set to false in MULTI_EXT_CFG_BOOL.
  (Daniel)
- Patch 7: changed LOG_UNIMP to LOG_GUEST_ERROR for invalid trigger
  action=debug mode when Sdext is not enabled. LOG_UNIMP is reserved
  for unimplemented features, while LOG_GUEST_ERROR is for invalid
  guest actions. (Daniel)

Changes in v4:
- Fixed linux-user build errors: moved debug_mode/dcsr/dpc/dscratch
  fields inside #ifndef CONFIG_USER_ONLY block in cpu.h, and wrapped
  all code using these fields with proper guards. (Daniel)
- Updated dependency from single patch (patch 5 only) to patches 1-5
  of Max Chou's "Add Zvfbfa extension support" v2 series to avoid
  compilation errors.

Changes in v3:
- Rebase onto Alistair's riscv-to-apply.next branch.
- Depend on Max Chou's patch "target/riscv: Use the tb->cs_bqse as
  the extend tb flags." (not included; apply it first) [3].
- Patch 2: default sdext to false in riscv_cpu_extensions.

Changes in v2:
- Drop the RHCT expected AML update from this series.
- Replace the split sdext/sdtrig config bits patch with deprecating the
  'debug' CPU property.
- Rebase and update patch subjects to target/riscv prefix.

Changes in v1:
- Debug Mode entry/exit updates DCSR/DPC and restores execution via DRET.
- EBREAK honors DCSR ebreak bits and enters Debug Mode when enabled.
- Single-step uses DCSR.STEP with a TB flag and a helper at TB exit.
  It references Max Chou's patch "target/riscv: Use the tb->cs_bqse as
  the extend tb flags." [3].
- Sdtrig supports action=debug mode for mcontrol/mcontrol6 and reports
  inst-count triggers in tinfo.

---

Differences vs Debug Spec (known gaps):
- No Debug Module (no DMI, dmcontrol/dmstatus, haltreq/resumereq).
- No debug ROM, program buffer, abstract commands, or SBA.
- Resume is modeled by leaving Debug Mode at cpu_exec_enter.
- Step/exception ordering is simplified: if the stepped instruction
  traps, the normal exception is taken and Debug Mode is not forced.
- Several DCSR fields are not fully modeled (stopcount/stoptime, etc).

Roadmap (next stage, DM focus):
1) Add a DM core with DMI access and hart state tracking.
2) Implement halt/resume handshake and move Debug Mode transitions
   under DM control.
3) Add debug ROM, program buffer, and abstract commands for GPR/CSR
   and memory access.
4) Add SBA if required by tooling.
5) Tighten ordering rules for step/exception/trigger priorities.


[1] https://github.com/alistair23/qemu/tree/riscv-to-apply.next
[2] https://github.com/riscv/riscv-debug-spec/releases/tag/1.0
[3] https://lore.kernel.org/qemu-devel/20260108132631.9429-1-max.chou@sifive.com/
[4] https://gitlab.com/TaoTang/qemu/-/pipelines/2446308835


Chao Liu (6):
  target/riscv: add sdext debug CSRs state
  target/riscv: add sdext Debug Mode helpers
  target/riscv: add dret instruction
  target/riscv: add sdext enter Debug Mode on ebreak
  target/riscv: add sdext single-step support
  target/riscv: add sdtrig trigger action=debug mode

Daniel Henrique Barboza (1):
  tests/tcg/riscv64: add sdext "not on Debug mode" sigill tests

 include/exec/translation-block.h              |   4 +-
 target/riscv/cpu.c                            |   7 +
 target/riscv/cpu.h                            |   9 ++
 target/riscv/cpu_bits.h                       |  33 +++++
 target/riscv/cpu_cfg_fields.h.inc             |   1 +
 target/riscv/helper.h                         |   3 +
 target/riscv/insn32.decode                    |   1 +
 target/riscv/machine.c                        |  20 +++
 target/riscv/tcg/cpu_helper.c                 |  91 +++++++++++++
 target/riscv/tcg/csr.c                        | 126 ++++++++++++++++++
 target/riscv/tcg/debug.c                      |  59 +++++++-
 .../tcg/insn_trans/trans_privileged.c.inc     |  24 ++++
 target/riscv/tcg/op_helper.c                  |  70 ++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  19 +++
 target/riscv/tcg/translate.c                  |  15 ++-
 tests/tcg/riscv64/Makefile.softmmu-target     |   5 +
 tests/tcg/riscv64/test-sdext-sigill.S         |  83 ++++++++++++
 17 files changed, 564 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S

-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330DEC982D1
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 05:24:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x74am-0007h2-0D; Thu, 17 Sep 2026 01:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74ai-0007fx-Md
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74af-0003z0-Te
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:23 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GMPdWU3107258
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=D20DLb2p+xFv0bVbi/YLom
 JUIr15uI9VMzap5nCr2Ms=; b=Ir7TRJMs0MY97+ob9S/3zZi8fpBFVW3z/HzMdX
 CeT8Gnuu8gMCmMnvhOEXotgzOed7VQMnhGHakp6Ix0tEDhss7E22vlbZFhJ5Pfk6
 nxYSuWejtkFl9ByCHOZ5ngjILTVyqykoD+QfukwCAXO59ULNU2qmzBQohBgfF2WA
 DXdZDhI+SLkfjq3UVLWkrRZCJNUHoPlEXUXZ2XZFQeWt34PHZfxxIh5qMka5xBLJ
 ZB8rxbyOheK/gYVSV4y4CZcWxdMRqfI5oQBhdkPPOc4ZaDHedRO8qsrIDo8g9s0x
 0rFXxjv66nhap6RJuYQKWI8YROiTQn5h6ku/S5oE5ZBiAvHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uk8x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cbee162355fso96294a12.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 22:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789622597; x=1790227397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=D20DLb2p+xFv0bVbi/YLomJUIr15uI9VMzap5nCr2Ms=;
 b=BjQSh8ECtYvp0RJ42+DI7/gAzl68XGX1fNLXNy8+sZQEkvNrW2ZA94C6Z9l/IebRM4
 eZXS7GCY3MUdRh3xYdorbRM86+OIYTRMUzmr4HEl/4/bUzW11yDK1UajCk/anVsbnFVH
 Qmye18+tzEPGlsRfJMJzDmxaW9BctNHhqKYYQFCdCGNnz0HwAVuDsoMPZHB7IgIXLftF
 jNOGZFzZsAjFKygMyDK2zzVXm86G6WkaFm3wBNL07pSfn6AKhVGeo+zhSG96VZI1TvjS
 gYvGTqWRpcnMGD2/jMaLgHxB9aZ2dxoSNt6vIU/n8OxXtmhip4zLdCaYTlpRq/PFOOBj
 yB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789622597; x=1790227397;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D20DLb2p+xFv0bVbi/YLomJUIr15uI9VMzap5nCr2Ms=;
 b=pYQBrCKPEsVkoafqcQlqHvS8lT9AdydrIueF+UgJv97lOHn0dv+ttFiKhqUKeFLh+C
 3h5Isx7Oe4VDdfd2wbDyIDoayzOc2BDHWxoboqHT4CZrCc9+vI0TG38zYEt1YCKuaIqe
 qB5XfMHu2gFu6dq08q8zDrB8tn/CWdj6l1uZkHy0of8AkCTcQuX3syb0t1GaG3dreSVO
 SDQhbLRPe5bL+pzKbPGdptrmVBmoipg5nnMDpclq+anuT4YxEo+ETScGRbGNO8Xgy3wD
 e8uEwDJo7tEk+gZMAyCfPVnbZt98ADPjj/iVmw79dSys0YK2+ppe8KizUfh+ZqWbTJ5d
 mtAQ==
X-Gm-Message-State: AFuF++m0mZ75YZoIM4rSF32v5vXpBHW57Ncg2wIwXwEPgXuLLZR7xB7k
 QZM0F84GQi/roAT4MM5Ru5MThMLZ116SqRM8BPJaH7nuYfDpEL+DbLhE/llaxq5EC2Qk7mG8Bz+
 Mpi7gT0BAlH85N/RbWej8TWbGpvTa2rkJstIffWNxIP412Xhrn0AX1KlMYg==
X-Gm-Gg: AYBFou0cZiADNoj1BST67NxsKXj1vYgLCO6lD6raB+SmmFD2nEHD91Vmo319EmiFEh0
 GatJgVz9ZA/xWmU/yhx7SPltxk9kb6EgNYO698PAdPOx9OVng365oPM2kEJcYg5Qt1iZt86hRCm
 WXeEoGoZ6thjL1gxPMw4YyH+s4k+tjaJTb/dDeK82RAHewM6NYsbMjIirokP7kA83DYgz78wqCt
 R887cxEEtFmnGpQ3Iszud3z/qkGO6QqRNG4FmtTN50hDvBKPfcdc+40sUHf7E5sqKZaoXfgbECj
 isvgQCCDvyYzOLK1XzoL8g49wiOrDW5puuF2eqpPuKyCFr3t3J08W1TfJGmcVo+xOuBPIOl7Uyt
 9V0pgf7QlUAzC6hXSLduorH4pBy4n/5Yc19dvp0zoTMljBsoIMfbt9qyndwghA4FzhFfWB4mAy7
 hLWeyl4p62XVHFtuwfksI3ETEUrwmFCb8=
X-Received: by 2002:a17:90a:c10f:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39e1e266589mr8273996a91.1.1789622596517; 
 Wed, 16 Sep 2026 22:23:16 -0700 (PDT)
X-Received: by 2002:a17:90a:c10f:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39e1e266589mr8273941a91.1.1789622595852; 
 Wed, 16 Sep 2026 22:23:15 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm14256187eec.24.2026.09.16.22.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 22:23:15 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v11 00/10] riscv: add initial RPMI virt support
Date: Thu, 17 Sep 2026 10:52:39 +0530
Message-ID: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX3W1guZ2GYidr
 r8cDnHFleJLHtjcOyccasGfOkD1M4QzbxCDcoB+nEbuo/N49TNwhdMTxgsKbYC4out7qInDjFFO
 3LsbF/NcD88JC9EB3o0Qu3aXuJBXkkw=
X-Proofpoint-GUID: aNzxFdGbCSJFClA5Cb11fK1hWvmRDIar
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab7945 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=081Sr7Ilyrv4IrdElTgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: aNzxFdGbCSJFClA5Cb11fK1hWvmRDIar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX7qOdn2RR1tuj
 XsuTbkkBfS619FZaAagKNC4dEOhrYujl/MwGQkkXOJ7wM0ToUv5cIbmRnPPXj+h4oElGKtz7ANu
 9ijz0NJJiny4+XA6HHhwm+bYlNHcSe50ipQpHiS80rRowJ4zyW+FbM4VbNSRtZLCqv4xfkU9ZtX
 7dn4Bmq/x+/jR53jwQHUoy8WavJAJZkn2OH1jVO8aZlfJ61XIJh6C4Mi00yT/q/9lpJaCAVHwoS
 Q7OqC+Y+3Y9suCdxESsKQMax+4JRwRn+lIjYtvqk2jZfhB4ygGxQH7aYFghf/CO+kUsejG5j68B
 eJp8iRJpWzqpwO6qqjvP5DCBoTRRVK6QJ70MueleILHk0Mb/8C1WnixxEpKLh8GkOooTzRWnp7M
 W8VlZX/dSqxOh0ocesayn2tVVzB5C2OE3qSFXYul7VhfBjdlgxZ3Nsi0AJKNR8NB+ysT7QXuupW
 EFwPZIOtJ8O+C6Vf+8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

This series adds initial librpmi-backed RPMI support for the RISC-V virt
machine. It covers the optional librpmi build dependency, the RPMI
transport and Base service, virt FDT wiring, opt-in machine support,
System Reset, HSM, System Suspend, documentation, qtests and a Linux
guest smoke test.

librpmi provides the host-side RPMI service-group implementation used by
this QEMU device model. The upstream repository is available at:

  https://github.com/riscv-software-src/librpmi

The documentation patch adds librpmi build instructions, "RPMI qtest
coverage", and "RPMI firmware and guest smoke" sections to
docs/system/riscv/virt.rst.

Changes since v10:
- Series-wide:
  - Fold the post-v10 mailing-list review fixes into the original commits.
- [01/10] build: add optional librpmi dependency:
  - Add Reviewed-by tags from Alistair Francis and Sunil V L.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Replace legacy physical-memory helpers with QEMU address-space APIs.
  - Propagate failed shared-memory transactions as RPMI_ERR_IO.
  - Use address_space_set() for bulk shared-memory fills.
  - Log failures from the void librpmi_env_writel() hook.
  - Document the external librpmi_env.h environment-hook contract.

Changes since v9:
- Series-wide:
  - Rebase on current QEMU master, commit 0a1ebd448b38.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Move the no-librpmi riscv_rpmi_create() stub into this patch where
    the public RPMI device API is introduced.
  - Use enum rpmi_servicegroup_id for service-group identifiers from the
    first RPMI config definition, with no-librpmi fallback enum values
    for optional builds.
- [03/10] hw/riscv: add RPMI FDT helpers:
  - Move the no-librpmi RPMI FDT helper stub into this patch where the
    helper prototypes are introduced.
- [05/10] riscv: add RPMI system reset service:
  - Use the librpmi RPMI_SRVGRP_SYSTEM_RESET value directly instead of a
    QEMU-local service-group alias.
  - Introduce the service-ops dispatch table in this patch, with the
    initial System Reset entry.
- [06/10] riscv: add RPMI HSM service:
  - Use the librpmi RPMI_SRVGRP_HSM value directly instead of a
    QEMU-local service-group alias.
  - Add only the HSM service entry on top of the System Reset service
    ops infrastructure.
- [07/10] riscv: add RPMI system suspend service:
  - Use the librpmi RPMI_SRVGRP_SYSTEM_SUSPEND value directly instead
    of a QEMU-local service-group alias.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Drop future/unimplemented service-group definitions and probes from
    the qtest coverage. The test now covers only the initial Base,
    System Reset, HSM and System Suspend services added by this series.

Changes since v8:
- Series-wide:
  - Rebase on current QEMU master, commit 539bc315538a.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Update the RPMI transport shared-memory helpers for the current
    physical_memory_read()/physical_memory_write() APIs.
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Add qtest coverage documentation alongside the existing firmware
    and guest smoke test notes.

Changes since v7:
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Drop the redundant internal RiscvRpmiServiceKind field from
    RiscvRpmiServiceConfig and use service_group as the single dispatch
    and FDT service identifier.
- [05/10] riscv: add RPMI system reset service:
  - Move the RiscvRpmiServiceOps table and service_group lookup
    infrastructure into this patch, so the HSM and System Suspend
    patches only add their own service entries.
- [06/10] riscv: add RPMI HSM service:
  - Build on the System Reset patch's service_group lookup
    infrastructure instead of introducing it here.

Changes since v6:
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - When RPMI is enabled, advertise reboot and shutdown through the RPMI
    system reset service instead of the syscon reset nodes.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Extend the functional guest smoke test to check the RPMI reboot and
    shutdown devices reported by firmware and exercise the reboot path.

Changes since v5:
- [01/10] build: add optional librpmi dependency:
  - Fix the librpmi configure probe to check the system suspend service
    group API used by this initial series instead of the later logging
    service API.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Keep later SBI MPXY/FDT stubs out of the initial no-librpmi stub
    file; those stubs now live in the later stack layer where their
    prototypes are introduced.

Changes since v4:
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Drop the unused machine-opaque argument from the RPMI machine
    callback API.
  - Move the no-librpmi riscv_rpmi_create() fallback out of the public
    header into a dedicated hw/misc/riscv_rpmi-stub.c file.
  - Add a matching RPMI FDT helper stub file for no-librpmi builds,
    while keeping the real rpmi-fdt.c source gated on CONFIG_RISCV_RPMI.
- [05/10] riscv: add RPMI system reset service:
  - Drop the unused machine-opaque argument from the RPMI machine
    callback API.
- [06/10] riscv: add RPMI HSM service:
  - Drop the unused machine-opaque argument from the RPMI machine
    callback API.
- [07/10] riscv: add RPMI system suspend service:
  - Drop the unused machine-opaque argument from the RPMI machine
    callback API.

Changes since v3:
- [01/10] build: add optional librpmi dependency:
  - Use "RPMI support" for librpmi-related Meson option and summary
    text.
  - Add Reviewed-by tags from Daniel Henrique Barboza and Philippe
    Mathieu-Daude.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Use the Resettable API instead of device_class_set_legacy_reset().
- [03/10] hw/riscv: add RPMI FDT helpers:
  - Gate the RPMI FDT helper source on CONFIG_RISCV_RPMI.
  - Add Reviewed-by from Daniel Henrique Barboza.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Mark no-librpmi stub parameters with G_GNUC_UNUSED.
- [05/10] riscv: add RPMI system reset service:
  - Add Reviewed-by from Daniel Henrique Barboza.
- [06/10] riscv: add RPMI HSM service:
  - Add Reviewed-by from Daniel Henrique Barboza.
- [07/10] riscv: add RPMI system suspend service:
  - Add Reviewed-by from Daniel Henrique Barboza.
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Add Reviewed-by from Daniel Henrique Barboza.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Add Reviewed-by from Daniel Henrique Barboza.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Drop the stale Ventana copyright line.

Changes since v2:
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Document how to obtain and install librpmi for QEMU builds,
    including source build steps, Debian/RPM package targets, pkg-config
    setup, and the minimum librpmi version.

Changes since v1:
- Series-wide:
  - Fold reviewer fixes into the original commits.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Move Base service configuration into the Base support commit.
- [08/10] docs/system/riscv: document RPMI v1.0 Ratified context and
    specification references.

Testing:
- librpmi-enabled build of qemu-system-riscv64 and riscv-rpmi-test.
- RPMI qtest: 18 subtests passed.
- Real Linux/OpenSBI guest: HSM start/stop, service enumeration,
  suspend/wakeup, reset/reboot, and reset/poweroff all passed.
- No-librpmi build: virt,rpmi=on is rejected with a clear error;
  virt,rpmi=off boots the guest to login and powers down cleanly.

Subrahmanya Lingappa (10):
  build: add optional librpmi dependency
  hw/misc: add RISC-V RPMI transport and Base support
  hw/riscv: add RPMI FDT helpers
  hw/riscv/virt: add opt-in RPMI base support
  riscv: add RPMI system reset service
  riscv: add RPMI HSM service
  riscv: add RPMI system suspend service
  docs/system/riscv: document initial virt RPMI support
  tests/qtest: cover initial RISC-V RPMI services
  tests/functional: add initial RPMI virt guest smoke

 Kconfig.host                               |   3 +
 MAINTAINERS                                |   3 +
 docs/system/riscv/virt.rst                 |  80 +++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   6 +
 hw/misc/riscv_rpmi-stub.c                  |  16 +
 hw/misc/riscv_rpmi.c                       | 574 +++++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 289 ++++++++++
 hw/misc/riscv_rpmi_internal.h              |  43 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 194 +++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   3 +
 hw/riscv/rpmi-fdt-stub.c                   |  38 ++
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 176 +++++-
 include/hw/misc/riscv_rpmi.h               | 114 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 184 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 625 +++++++++++++++++++++
 26 files changed, 2727 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/riscv_rpmi-stub.c
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt-stub.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c


base-commit: 0a1ebd448b38afaa118597cbb633dbec24ef74d3


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4D606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1sI7nSn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUT4o6uW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR1RZ-00081F-5Y; Wed, 11 Nov 2026 01:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1RX-00080M-2d
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:04:23 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1RT-0000Vp-Ts
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:04:22 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KGXg419491
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Uq7+4fkypm7rfc4qywrVir
 gyGJFih+A2E3ybr5txmfk=; b=Q1sI7nSnRIW+/DmhEuUAI7vJA6/F4PZDVMU3hJ
 Z15fkvKpz1X5IYHSMVhWKw8FpTNOKtv1flj1jJI9TUb3SFvLhdO9QmJW+A1MGD/G
 ClLy7BdwrgMcS1m3mXKVGvrNd1msY33WCmK4O1XsVhdZEq8kNPYck5IiRITFSlg7
 7ZsrjUilH931U7ONZYQOeh2ERZWCdNZon1a19ZsNt/sPR32fR02CA7SQXdHpoAHq
 SeG2YfN1DuSgqEjySPnglHWZKuTmkFgLo91pwT2XV6dvHo/x3Z373SwXxWbXfbWw
 EP6duDfkF5OVqvXB/Tuv9yw6JeZH3sVUkD7kE8IplgdW8xEg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4ckf8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:04:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36f9bc93925so30956eec.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794377055; x=1794981855; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Uq7+4fkypm7rfc4qywrVirgyGJFih+A2E3ybr5txmfk=;
 b=TUT4o6uW+RByebzFmBy+MgahpeVDg4jY9/JwLlNiz77cYIBfgXI29ImpSPdttrirVT
 jrVoSDpb7Pqzi/eKS0ILnyAEmgp/BYdG3I7WP0ecc0oNg5Nq7vxciRHM7vl/WvsUIcMj
 yD9ATs+MRBOEfqBkviHNi9+eH1GpUwPyRnueTTjxoKcxjZhRjOuzpbXMXjiyW17b1OJc
 cfbas1ACXbVWZ5WVd8UJOaKQUPyV76O8Z4kpkI0OXc1rWXg/L4ZEGmbNhgjV4LJtVWzc
 HCknrJnoN+M9JKc3FUHHleOovveTOWi7hOSgEbX9lVvySOTeGWFm7pI3u0TohJ6iebP8
 9GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794377055; x=1794981855;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Uq7+4fkypm7rfc4qywrVirgyGJFih+A2E3ybr5txmfk=;
 b=OQ9Zm+tSI3YebcJGW1LRvZO52zp+JOKsR5lESwWCR/o+HCTi/oxlbNX2jNCwFg7gOO
 RzGguJYq1MKe7yYhazzHr3yzl/0uxszqWzhHKSUe9eToNjybCH4hmhWM/vXz0CcrxkMR
 JSjzhu+VFJL6ioGYZNmVf69l5zY+jPqw/kMgLLbgpZZccaJFZRmX5QAo3mkUF4iEQCbh
 EB5CwR3czhoEYmJsN7c542Ir7B/K2l9QKCwUT34fiEE1ao0beu5NrPVjX8Ttoa0rjnvU
 /X6jj2vIw+NVdYhW+V2YlG2OwVHT+en0Y2+rJrRX/t++gFKU6k0l1OBQqGxXvYXveLGH
 YWhA==
X-Gm-Message-State: APuU4Z87LnlV5eCbB93gvDB5nvRoG0OnHuRSgLCTmTshOoCzwq0Hycgd
 4KcOgenFoeLenrUEt4RLq6RZ9GP4AgIQfpJWQfigyobkBMe/Y1Ray00PmOL/nbOT5bXvews0wKZ
 8z4Sb1KG8uQiv5Wo1OW/Pu36HHdrhGkneg7SKUfe0FfgNHgFtrzZzR6xAyQ==
X-Gm-Gg: AYBFou0LpRcWDn+WgnQSuKOqIrqtQU7ZoNmhyxSrW/dfz90WwNiRTRyrfxLqUlsxbca
 bP1utqAWNlQAcWj79wKfpHrVyDFmqgtcabtfALse/bfQmJh26vNHTrH40f5t3tCUEBS9dTTJWUR
 b5XUIOb+05xm1t+IQOJ+OuCXwFtpRuugIOlTLARIJbA1Os96/DFKUb8kjGTUJOsN9baTJ94K8Df
 XbmDHt9MEsyHwM2zZcjHthsw5T5oLCJI7+b3GKMobkuvI3ovMZWEPwgAyk09e6lCnh6RNQkVc64
 V9x06FqYa7HgrCHmk+k6MCVODmYcm1eULAWei7/KDKSfBGgf7FM7VQM72C0nv10uRLZ0DHAsAki
 f08bQi0B5Z+0pOmhOfAu6bg0F0lpAt3QcAkOVs79N9+g09rIvnKNWkRadO0Mu+yUX9my4+PXZLT
 TEnDB8MINoskM/mvheBWFf9pPBOhM6vFw0yyrtPv4e1hXJYEywCuU1zI7N3pBC4KTDCvS7qIf3t
 FUPOFg=
X-Received: by 2002:a05:7022:5f1c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1b3c02e9530mr1913386c88.2.1794377054649; 
 Tue, 10 Nov 2026 22:04:14 -0800 (PST)
X-Received: by 2002:a05:7022:5f1c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1b3c02e9530mr1913328c88.2.1794377053726; 
 Tue, 10 Nov 2026 22:04:13 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm15067990c88.11.2026.11.10.22.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:04:13 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Charles Perry <charles.perry@microchip.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Philippe Mathieu-Daude <philmd@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 berrange@redhat.com, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 alex.bennee@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v15 00/10] riscv: add initial RPMI virt support
Date: Wed, 11 Nov 2026 11:33:52 +0530
Message-ID: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyMyBTYWx0ZWRfX3Fjh7VUgUDSi
 J6s9lD+2+B9cHsLwVayO7ncA7TP5Uc6CFbiwmSaFQeHpxRcWIVqtG6z+bA7geFBFncG/Vd6s1Sc
 QxAGSYi+fMGP1EjTLkFbkSc3Kaylz9kQ/TN+g1f1a7hBlGR8mXLHI3Ltg0npWwh6mmiruXU4N3M
 u5jRRJe/2bd9+n0WPMVsDp/NpaYTuCp+OcgtgqP6W77tX841O+S8SmjaVqdCtJkcj7PYYOafjN9
 s6H11ZW8YhFkdltT3n+S9O6ngY7gs+gYElAt2udEquw0gPGTTann3ShODGDnHa+oXuYIx9guMIx
 e3VawNyVJN8mD8BsOQX+DIqPgRaTEK/cHV4DnNTaio2IrlHCXRggMG8vcFt9Xx20RpCb59aMm6f
 0oX1up8q+ABKqodmbSsba1Gf67U92dKBerIXdelYQkE0lKBUuiyFNag+syvYNBFUsCXbQgXOnF9
 dy/HpErb+1z2FIWPhKg==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af4055f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=g6twbWAWAnNQVo6HhtYA:9 a=M1xFRBUPFmsKplRP:21
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyMyBTYWx0ZWRfXx12ocI9pPv9/
 juhuV2T3/GlOuPCaIgZwBkPk6GHApNj4cSlTvNyZ08Sj9kkwkfJGfeoXqVsHCmLgExq9H6y4Yz3
 iN4oGgSZnLx2wxa8r3reDghAiqmGQNA=
X-Proofpoint-GUID: 16aXPqFWYHHdIQV5jrEd1Ai9ymrJ8ZwU
X-Proofpoint-ORIG-GUID: 16aXPqFWYHHdIQV5jrEd1Ai9ymrJ8ZwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110023
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial librpmi-backed RPMI support for the RISC-V virt
machine. It covers the optional librpmi build dependency, RPMI transport
and Base support, virt FDT wiring, System Reset, HSM, System Suspend,
documentation, qtests, and a Linux guest smoke test.

librpmi provides the host-side RPMI service-group implementation used by
this QEMU device model:

  https://github.com/riscv-software-src/librpmi

Dependencies:
- librpmi 1.0.0 or newer, available from the upstream repository above or
  from the distribution packages documented in docs/system/riscv/virt.rst.
- A RISC-V toolchain and the firmware/kernel/rootfs artifacts required by
  the functional guest smoke test.

Changes since v14:
- [07/10] riscv: add RPMI system suspend service:
  - Ran sashiko locally to weedout the review warnings.
  - Check the callback hart index and target CPU before dereferencing
    configured hart state.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Check invalid System Suspend hart-ID rejection without a suspend event.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Raise the outer Meson timeout above the test's 360-second timeout.
  - Fail on the suspend failure marker without matching echoed shell input.

Changes since v13:
- Series-wide:
  - Rebase onto QEMU master at
    74f7bf4c59e6b6d50dbc6e124d93440be8be4386.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Size each A2P request/ack queue from one quarter of shared
    memory after an 8 KiB allowance, increasing it from 1 KiB
    to 30 KiB. Retain the existing two-queue transport.
- [07/10] riscv: add RPMI system suspend service:
  - Reject misaligned resume addresses and addresses outside the
    target hart's address width before accepting suspend, and
    require the resume PC to be backed by RAM in the active
    system-memory map.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Check resume-address alignment with and without compressed
    instructions, MMIO and unmapped-address rejection, RAM-backed
    addresses, RV32 width rejection for mapped RAM above 4 GiB,
    and recovery after rejection/reset without suspend side effects.
  - Verify the enlarged DT queue ranges and last-data-slot
    wraparound, accounting for the head/tail metadata slots.

Changes since v12:
- Series-wide:
  - Fix HSM stop completion after guest tests exposed divergence between
    cached RPMI hart state and actual WFI state, including HART_STOP failures
    after suspend/wakeup.
  - Fold post-v12 review fixes and build corrections into their owning
    commits; retain the v12 FDT hierarchy/schema fix and earlier fixes.
  - Drop earlier Reviewed-by tags from the materially rewritten HSM,
    System Suspend, and qtest patches.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Keep librpmi calls under existing BQL ownership because its environment
    lock hooks are no-ops.
  - Remove unrelated global event polling from doorbell handling; service
    state transitions now drive their own event processing.
  - Reject request queues too small to hold queue metadata and a data slot.
  - Name the minimum queue size RPMI_DATA_SLOT_SIZE instead of repeating
    the head, tail, and data-slot size expression in queue validation.
- [03/10] hw/riscv: add RPMI FDT helpers:
  - Remove duplicate helper arguments by passing the service configuration
    directly, and allow Base-only callers to omit the mailbox phandle.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Keep this intermediate commit independently buildable before the reset
    service lands; retain legacy reset nodes until [05/10].
  - Keep queue sizing local, drop the unused MSI phandle argument, and
    document the librpmi and TCG requirements.
- [05/10] riscv: add RPMI system reset service:
  - Include the runstate API here so the callback-introducing commit builds
    independently.
  - Preserve little-endian responses without alignment-unsafe buffer casts.
- [06/10] riscv: add RPMI HSM service:
  - Complete accepted stop and suspend requests only when the target hart
    actually enters WFI; no later RPMI request is needed to publish the new
    state.
  - Observe WFI persistently and replay the observer on the target CPU so
    stop requests arriving after WFI are not missed.
  - Run HART_START on the target CPU, keep stopped harts off until that
    request, publish RPMI state under the BQL, and drain target-CPU work
    during teardown.
  - Reconstruct HSM state on machine reset to avoid stale service state.
- [07/10] riscv: add RPMI system suspend service:
  - Align suspend completion and wakeup with the corrected HSM transitions;
    process only its accepted event and avoid stale wakeup work on teardown.
  - Recreate the suspend group around HSM reset reconstruction.
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Remove the obsolete RFC caveat now that the binding names are settled.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Match the non-executing qtest accelerator: expect pending states, reject
    HART_START while stop is pending, and check reset recovery.
  - Remove an invalid target-PC assertion and use the negotiated response
    slot for variable-length replies.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Bound the wait for online after CPU death: Linux's offline mask can
    precede firmware STOPPED. Keep transient errors visible and require
    eventual successful start; STOP_PENDING start rejection remains tested.
  - Verify completed stop/start transitions, repeated stops, busy-hart stop,
    reboot recovery, and HSM operation after suspend/wakeup.
  - Tighten console checks to prevent echoed commands or stale prompts from
    producing false passes, and fail on fatal firmware HSM diagnostics.

Changes since v11:
- Series-wide:
  - Rebase the complete series onto QEMU master at
    d73149283205645625bfa9fe029cfb68e4c4a9ae.
  - Fold the FDT/schema review fix into the original commits.
- [03/10] hw/riscv: add RPMI FDT helpers:
  - Emit RPMI service nodes as /soc siblings of the shared-memory mailbox.
  - Remove shmem_base from the FDT service helper API.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Update virt FDT wiring for the sibling service-node layout.
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Document the sibling service-node hierarchy and updated helper behavior.
- [09/10] tests/qtest: cover initial RISC-V RPMI services:
  - Add DTB regression checks for sibling paths, mailbox phandles, service
    IDs, and rejection of the old mailbox-child hierarchy.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Revalidate librpmi and no-librpmi builds, RPMI qtests, and real guest
    smoke tests after the FDT/schema fix.

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
  - Use enum rpmi_servicegroup_id for service-group identifiers from
    the first RPMI config definition, with no-librpmi fallback enum
    values for optional builds.
- [03/10] hw/riscv: add RPMI FDT helpers:
  - Move the no-librpmi RPMI FDT helper stub into this patch where
    the helper prototypes are introduced.
- [05/10] riscv: add RPMI system reset service:
  - Use the librpmi RPMI_SRVGRP_SYSTEM_RESET value directly instead of
    a QEMU-local service-group alias.
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
    System Reset, HSM and System Suspend services.

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
  - When RPMI is enabled, advertise reboot and shutdown through the
    RPMI System Reset service instead of the syscon reset nodes.
- [10/10] tests/functional: add initial RPMI virt guest smoke:
  - Extend the functional guest smoke test to check the RPMI reboot
    and shutdown devices reported by firmware and exercise reboot.

Changes since v5:
- [01/10] build: add optional librpmi dependency:
  - Fix the librpmi configure probe to check the system suspend service
    group API used by this initial series instead of the later logging API.
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Keep later SBI MPXY/FDT stubs out of the initial no-librpmi stub
    file; those stubs now live in the later stack layer where their
    prototypes are introduced.

Changes since v4:
- [04/10] hw/riscv/virt: add opt-in RPMI base support:
  - Drop the unused machine-opaque argument from the RPMI machine
    callback API.
  - Move the no-librpmi riscv_rpmi_create() fallback out of the public
    header into hw/misc/riscv_rpmi-stub.c.
  - Add a matching RPMI FDT helper stub for no-librpmi builds, while
    keeping the real rpmi-fdt.c source gated on CONFIG_RISCV_RPMI.
- [05/10] riscv: add RPMI system reset service:
  - Drop the unused machine-opaque argument from the callback API.
- [06/10] riscv: add RPMI HSM service:
  - Drop the unused machine-opaque argument from the callback API.
- [07/10] riscv: add RPMI system suspend service:
  - Drop the unused machine-opaque argument from the callback API.

Changes since v3:
- [01/10] build: add optional librpmi dependency:
  - Use "RPMI support" for librpmi-related Meson option and summary text.
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
    including source builds, Debian/RPM packages, pkg-config setup,
    and the minimum librpmi version.

Changes since v1:
- Series-wide:
  - Fold reviewer fixes into the original commits.
- [02/10] hw/misc: add RISC-V RPMI transport and Base support:
  - Move Base service configuration into the Base support commit.
- [08/10] docs/system/riscv: document initial virt RPMI support:
  - Document the RPMI v1.0 ratified context and specification references.

Testing:
- RISC-V builds with and without librpmi: passed.
- Without librpmi, the default virt machine realizes and explicit RPMI
  enablement rejects with the expected unsupported-build error.
- RPMI qtest suite: 20/20 subtests passed, including invalid hart-ID
  rejection and the existing resume-address, HSM and reset coverage.
- Linux guest functional suite: 6/6 tests passed, covering repeated and
  busy-hart HSM stop/start, stopped-hart reboot recovery, service enumeration,
  poweroff, reboot, and suspend/wakeup followed by HSM stop/start.

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
 docs/system/riscv/virt.rst                 |  79 +++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   8 +
 hw/misc/riscv_rpmi-stub.c                  |  16 +
 hw/misc/riscv_rpmi.c                       | 599 +++++++++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 359 ++++++++++++++
 hw/misc/riscv_rpmi_internal.h              |  43 ++
 hw/misc/riscv_rpmi_sysreset.c              | 185 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 210 ++++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/fdt-common.c                      |   8 +-
 hw/riscv/meson.build                       |   3 +
 hw/riscv/rpmi-fdt-stub.c                   |  24 +
 hw/riscv/rpmi-fdt.c                        |  92 ++++
 hw/riscv/server_platform_ref.c             |   2 +-
 hw/riscv/virt.c                            | 144 +++++-
 include/hw/misc/riscv_rpmi.h               | 112 +++++
 include/hw/riscv/fdt-common.h              |   3 +-
 include/hw/riscv/rpmi-fdt.h                |  34 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 target/riscv/cpu-qom.h                     |  16 +
 target/riscv/cpu.c                         |  61 +++
 target/riscv/cpu.h                         |   7 +
 target/riscv/tcg/op_helper.c               |   4 +
 target/riscv/tcg/tcg-cpu.c                 |   1 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 269 ++++++++++
 tests/qtest/meson.build                    |   3 +
 tests/qtest/riscv-rpmi-test.c              | 762 +++++++++++++++++++++++++++++++
 34 files changed, 3075 insertions(+), 4 deletions(-)
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

base-commit: 74f7bf4c59e6b6d50dbc6e124d93440be8be4386


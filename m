Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB98606A32D
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WeZPmNEF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv+hHC/q
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMPu7-0005pF-5j; Thu, 29 Oct 2026 09:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPtv-0005jN-Uw
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPtt-0005y8-7j
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:39 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TCdwWS3943681
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=tEzoqaHozmXixHHqgYx6x1sDLjgILRLHgU0
 BP8UH5+E=; b=WeZPmNEFsdxlZCJlnZHXhAY/dJcsgf2/YrUi0jD+H4jUDKvMO90
 PfQ8qp6//dCLcjFTgZWC5QKMayERxUdDZJBANLkcxCsd46huAsl+5Zi2cXy5E2xR
 jgVpbLYa5eeY5G66CYXU7BMpzWvZtN5ZN7rBlTCLypLzEsaJmnAH0LDGezS+QNhW
 DnQGMH0DlqEvt6uTIvaTbZGMQVwpirsi8fr+p9JWlzR6XMjQiIOuZfFGU/bg5n8w
 RIKtkLBp/jySUhYC0ArEdv3OD3VB3XS4W0ramhvbM5LyezCdxv0wl5xgQ1zMlIhA
 abZ9VNvDCL3qL63B+VKTRjpHX4D462l1igQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgmaf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2eb2437d752so7258945ad.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793279431; x=1793884231; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tEzoqaHozmXixHHqgYx6x1sDLjgILRLHgU0BP8UH5+E=;
 b=Lv+hHC/qgNWecxqQAYO+xreKs5GPu4dAbFK7xKCaDvML8CgWIGENO4e3ysruHm89os
 xDN0iYcNJ5bdR7DVzLn6Kw8qAZeB6KNlqFPaLyZ+gIJ5LL6QA31dlgvuzE1sgkw7qs0V
 PBg/tQg6TwuzB6h7hvBl8B/kNtYMMcc2rglLgQfGhOPTaafhQ/2beQUU+zfI34a7aS8e
 GE9jcXShqwbJzQqOZH0UnVAKqppHxBF7rt1M3KK9GABqwoZxpRMhqj8I1enKS+8I/wjR
 BSDDCS7O/BbhbCkiBE075bt4sDrSwTEpOt1M2T1UKzZ/w1i/fm1NF7RWA/ty0PMESmM3
 HSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279431; x=1793884231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tEzoqaHozmXixHHqgYx6x1sDLjgILRLHgU0BP8UH5+E=;
 b=Oo+eWgqaDn8mzHiTZX+dnH0BEgP5Jb4j8IfI9D+SZYTkPNbZ36b2gQ96itrXyj7jwx
 9tkaw/Pq9rVGF2mqrvj7Ikq1jMvL2EHPtmWWSbGb50GluPFWcQwOwoyWJGWP9TRjIO07
 r5PSKYiQ2r5LLcYn2h4gtYOSPT+GY5eI2nYI4UD+zYPrjH3dhupzTsb+s4+MXQVO1zLd
 2PpxHy84qv/PtuyPhPBfbxqmp2wm/gICXwNdmWgjjr2YIyGpa9gqUXhB0DeX0C51rNBE
 7DErjIz6Ct7nk4iwu1PrjdnTrHnn1u9E2ntzc2DNmTcUjtpC911fVry9/8QZLdA7CoC7
 iCBw==
X-Gm-Message-State: AFq9FYJE6BnolOyuaMFB/fBcQ+z4xW20/auG/eSb4dX2X6JWo9ALyb1J
 LTzu79JekTqFMiH0taywNjVeOJzcioiC+YRtbOFlIKXDhBStfn1PCsuf/qB7GW5ADT6II9Ctp06
 iTeowxirBdzUdTpZ6SK2hr9Bc9ndFHF/FMR39jgVwJacYK1/OKleyUzBh9ypShHTqPQ==
X-Gm-Gg: AYBFou3NqcqvwpM6C2QNPcbGanJBEIRNDjN2CcZUNci+lyOgNah2TDgQfGqyun1j4mJ
 MtIwtYbFbF4Z67BdPDHDgOZusU1NUtuRsIbu07AwSVJXfmrkBV7h6oS/QnY9Lkl8G2evgGl5kAd
 Y8zAdcdAp54mhPjmB/+cM3OJsopfCdGgTJT0qT590jEVd8WDs3Pi3AuEau/ioR8bFYbc9O1LR+N
 RDmPyA+g9Q4xIdI59Eh4Ah9TD0sw34cD4DabROPZzOJmrNdN4VON+UGGH0jJ1GHBpxZ8VvEnoVd
 WTRsugQi1J72PQKUUhUSP4eSsVW+BczirOylVAugHwQJ5q1jJ95ZuAoMhp5386j1AobhSuStpS7
 iUL0rujoXpCRNL55juAfO9p3YzaDQx8mQoqM+e+zN01kmpEuwrZuQLBQgYQTN067YOP7Bd+FJB0
 oTU2sXVZHRCTD01NCI3ATgWX8SISTSwiq+lbBdX6RyykoEhigRKkrPvLzmp6rfoidz7jOwR8bSl
 Ys=
X-Received: by 2002:a17:903:19cb:b0:2d9:216a:cdd3 with SMTP id
 d9443c01a7336-2eb0048889emr52325225ad.18.1793279430679; 
 Thu, 29 Oct 2026 06:10:30 -0700 (PDT)
X-Received: by 2002:a17:903:19cb:b0:2d9:216a:cdd3 with SMTP id
 d9443c01a7336-2eb0048889emr52324825ad.18.1793279430047; 
 Thu, 29 Oct 2026 06:10:30 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2eae6bd60desm34467845ad.29.2026.10.29.06.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 06:10:29 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [RFC PATCH v2 0/2] RISC-V Sspesa: QEMU model support
Date: Thu, 29 Oct 2026 18:40:07 +0530
Message-ID: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXy1pd37iCmPME
 iSUaKEZiWX+cUuaYilIrPo8xHARVwTagcUB49Pu/+j1s6rO41h+pVOQ1cpgQdmcFA1xoeHFVa7X
 7zcTt+cDi3ONE+Jr8DNegeier4RCOJarmfg8+MVysm1SakMajAasYA5nmq8kHYU/s3jvC2J7hwI
 9jZyJ71mWdE5BfoQHuc76RZJ8muIThDPeGf34xNOgzJqyW6NWarf/bqrf150UHn+TVhGYT03vNB
 o+6iqDXjGEzjMgIw3qwaoMkXr8G1cTCEVLZEPECZXhPnu4rjAaak+1TXChp0vgnzBetOUm0fW8e
 eweCB1uNmhog+2/fHy0aHnQEqztOE6zjAhetxbgPBG7GQfI9kcfgFvH4JIAM1h0uhQtDfZDH/Qy
 621ngUNfL9wxYOKA9utJOuoECn1UHGpDvJeVd2+MGb/et7kaFAdILmEAHD1i/SPzKo0lWh17ELf
 uaMqKTMgRosW3JRJ5Jg==
X-Proofpoint-GUID: dHBRknARSE610mlB_doUuf5fVD_bFCEk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX4BoKTBtY1KMz
 Bxz24QAyYrrXPQsvPSqtWnda9txCyFXfyYKbMKiTSff8YRiYcaxxzcXk7QdU290iRj8t/yaKEWw
 CvglGe25nNMT3BCxEcd2WhG+ZOqObjo=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae345c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=JfrnYn6hAAAA:8 a=VxJIORW4uAIu6BL9gzEA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: dHBRknARSE610mlB_doUuf5fVD_bFCEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This QEMU series adds support for the Sspesa (Precise Event
Sample Attribution) extension.

The first patch adds the 'sspesa' and 'ssplcofi' CPU properties, the ISA
string/DT entry, and the shpmspc/shpmsdata CSRs. It also adds dependency
of Sspesa on Sscofpmf and of Ssplcofi on Sspesa.
The second patch captures the overflowing counter ID, priv mode and pc
for the first counter overflow.

Note:

QEMU does not currently identify any event as supporting precise
attribution. The QEMU setup is intended to validate the end-to-end
Sspesa plumbing only. Similarly, the `pesa=1` raw-event format bit in
Linux is used to simulate an event that supports precise attribution.
Such events are expected to be defined in vendor/platform specific
JSON event files, but this series does not add such an event file
for the 'Virt' machine.

Reproducing the full setup:

Sspesa support requires Linux, QEMU and OpenSBI. The matching v2
branches are:

  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v2
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v2

OpenSBI must be built with the following fix so that PMU overflow
interrupts work correctly:

  https://lists.infradead.org/pipermail/opensbi/2026-October/010957.html

Build Linux and QEMU from the branches above, and build OpenSBI with
this fix applied. By default QEMU doesn't define a raw event that can be
mapped to programmable counters and hence a special test DTB is required
which includes the raw-event-to-counter mapping.

Build the test DTB:
  - qemu-system-riscv64 -machine virt,dumpdtb=/tmp/virt-sspesa.dtb \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true
  - dtc -I dtb -O dts -o /tmp/virt-sspesa.dts /tmp/virt-sspesa.dtb
  - Edit `/tmp/virt-sspesa.dts` and add the following property to the
    `/pmu` node:
    riscv,raw-event-to-mhpmcounters = <0x0 0x2 0x0 0xffffffffffff 0x7fff8>;
  - dtc -I dts -O dtb -o /tmp/virt-sspesa-test.dtb /tmp/virt-sspesa.dts

Boot Linux with the test DTB:
  - qemu-system-riscv64 -nographic -machine virt \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
    -dtb /tmp/virt-sspesa-test.dtb

Once Linux boots, use the PESA event modifier with a precise request:

  - perf record -o /tmp/sspesa-perf.data -e 'cpu/event=2,pesa=1/ppp' <workload>
  - perf record -o /tmp/non-sspesa-perf.data -e 'cpu/event=2/' <workload>

Check the resulting data with:

  - perf report -D -i /tmp/sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head
  - perf report -D -i /tmp/non-sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head

Samples in sspesa-perf.data should have the PERF_RECORD_MISC_EXACT_IP
bit (0x4000) set in the misc field, while samples in non-sspesa-perf.data
should not have that bit set. This verifies plumbing only regardless of
whether QEMU supports precise attribution.

Changes since v1:
  - Record the effective privilege mode in the new shpmsdata.PRIV field:
    https://github.com/riscv/riscv-performance-event-sampling/commit/3eff81a6161ffc7a74a57436132d0c15ab549e74
  - Capture shpmspc at counter overflow, instead of during interrupt delivery.
  - Preserve the first sample as long as LCOFIP remains pending.
  - Update sample CSRs only for delegated counters when menvcfg.CDE=1.
  - Fix extension dependencies i.e. Sspesa implies Sscofpmf and Ssplcofi implies Sspesa.

Mayuresh Chitale (2):
  target/riscv: Add Sspesa extension and sample CSRs
  target/riscv: Capture Sspesa sample PC and counter ID on overflow

 target/riscv/cpu.c                | 24 ++++++++++++++
 target/riscv/cpu.h                |  4 +++
 target/riscv/cpu_bits.h           | 11 +++++++
 target/riscv/cpu_cfg_fields.h.inc |  2 ++
 target/riscv/machine.c            | 20 +++++++++++
 target/riscv/tcg/csr.c            | 55 +++++++++++++++++++++++++++++++
 target/riscv/tcg/pmu.c            | 39 ++++++++++++++++++++++
 7 files changed, 155 insertions(+)

-- 
2.43.0



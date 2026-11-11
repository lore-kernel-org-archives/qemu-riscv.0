Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD6606A324
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgMpF82d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzukRYkY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR8T4-0007Ak-LX; Wed, 11 Nov 2026 08:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <himanshu.chauhan@oss.qualcomm.com>)
 id 1xR8T2-0007AS-F5
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:34:24 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <himanshu.chauhan@oss.qualcomm.com>)
 id 1xR8T0-0003VY-Tg
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:34:24 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABCZHV12338579
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 13:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xb1iim9H9XWZ4MIb7b7pRrjmG7CN6f5Q8Ji
 AT0/4hqc=; b=kgMpF82dW1ByvzM3Wy3o5mdBEct6CZY459LLFv7uuImrdtAG7g1
 eB86QpOhPmNd+HUwQFfC0knErBXMtLrHGeEIfd1enzipIGQLujb90CJ6GWt+Dgv2
 t0f44uFcguon+T08Hb+2MpNSvafb5Pbpi0unrrbm/qnQlkIyf3bLpp7No/expJrn
 WYEq9siqngnYp0qEU5Rlzw7SsEg64bT+tco687rAzY7SZbwPj0GY5yoo2CdswNni
 7CvVt3hNKmg/JnkVwuHkZEeoIg9tjWCkcy11rYbc8PP2wDotSw1CujIngOLEsua3
 N/Ez9D8JweEe7TywabUxo2cFyHOVh92sU9Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmateb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 13:34:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-37549877380so2829541eec.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794404060; x=1795008860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xb1iim9H9XWZ4MIb7b7pRrjmG7CN6f5Q8JiAT0/4hqc=;
 b=IzukRYkYQMIXiT9gek9hfUhKpM0OOPtDWf7Pq2JV3HwaOlA04HYtOVjjoEnXMDjnyy
 f/JqJcl9wKgRzQlXtiRRVgWCPYINtZEeyryGfxf5rbye3Kp9rhyrbxVV0Vc+ke3W8S+L
 +2g2S5vEOt03SK93uW2cO+lt3XIu1dPQvGcIsu67mXcLaEV7+8UrnV/mXOOfcc8swlFD
 lNqj0vb5sfWcvptValMReNWe3KwgzvXJbvcSfsCvo9uKW54ondhjxUWC8V8yxnM5oVX9
 QsvE7krzB2GC2BZMx38BVFWktzqu6cY7VCgOar62LAYEe4sgF5lEC1Fqul83Gl23zxKv
 3aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794404060; x=1795008860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xb1iim9H9XWZ4MIb7b7pRrjmG7CN6f5Q8JiAT0/4hqc=;
 b=AGklexEwZfY184VtF4uAH5DeNLxPcDQBB6ObMN9moymS1P4G+R+CPSpaJuEEQqXSNu
 l6BVlFawgMSS6WpByWRo4QUalJbGbHXRIVkg2CShlaqe4uJgjIXS0G1JuDwKUxPXypcX
 G9XWuTEMDf6j6/C6t6e5XBx+dZ7qQOpTVfIk7GQiOd4R6zDvXvDbWpJsVgxeq3Db7r8g
 4zF0/NspGbS86ySefLmkwr9fD1t12MS8rE74lWRJsNgUXb8OoORQ82hF0aNB1ZX1ohqt
 BpNvepid3LqWDEMQ4HlPn4WAexriSv7HvXmb1VfetlcaUUXw1Vs4AMU7XC2XE/pQ9C6n
 PJDQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGUpqJ+SDbxBQ1dcdMU4duEKVxco6/NaQ7YK9lOtj/8tdukjT5lmJlYz8tl1Lt4aohRMJq1lqT/iT4Z@nongnu.org
X-Gm-Message-State: APuU4Z+ixvYTGz78e3S5RB53JzXXzhK/+eAF8j2C2AjyuXQUnE/9AZor
 4NxWaHHI4YGPvHoCX3cSKd0ZHDK1nVKBVB1VatMLiTDRbjJDwJbIFhMtC1WVGqRXEIq+KQfjXd7
 VxQDKGVv7SGBpQpxQjqEpK7DPYo903x9sqPI+/k+1iuSnP6XWSCG33Hl1kw==
X-Gm-Gg: AYBFou1bFOmmY9+P+HSnwmRmYnmJgh2Fu7S60mPCuIySj2ERyDHfcmJe4e+9DrUs5g2
 tS1dbIKOBK6jUjzCe4UaVU+xkoLbzBSa0URi1Af2wXUS11KzGeJNBa63OcNcfwh/Y/bPY7Jg0c4
 POSqD2SUmuTUz80KBkHWGvArxbOQMXaJhuMJOPDSmx80CFmvDsXvEVXn3ScmPfnqX/T9B7iE6Ft
 F7ysR1WFFbTbaFNAItwaD+W/vNoM+UlBdpdH4TNTnUiHl+56GGKjBj3P8UBRZ25JdIxtg2Ghv4e
 DG/YzsoIZmk4yE4djLUhb/zU175/m8E1auDcUwva8emjBqs0jixMo0UgVWxyfA8qWze3LfSwRA3
 B+Sf1frgAKP39TmKc/KqFO5nLNoySp6AD5AVtTwlIOGxRfhAv3DSQ7lfvKuUEOrLhrIBlkquIUH
 oEgS3jBxp7Cvfx+o2MGSuarRQTwSpnjodfcgbHljJDHnrdZ2BR8OS8QYut6YG2feu6cToeOd44
X-Received: by 2002:a05:7301:dd8f:b0:370:d6e4:e8aa with SMTP id
 5a478bee46e88-37687214732mr2999426eec.41.1794404059710; 
 Wed, 11 Nov 2026 05:34:19 -0800 (PST)
X-Received: by 2002:a05:7301:dd8f:b0:370:d6e4:e8aa with SMTP id
 5a478bee46e88-37687214732mr2999397eec.41.1794404059038; 
 Wed, 11 Nov 2026 05:34:19 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-37520cfdfc6sm18350810eec.17.2026.11.11.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:34:18 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv: Fix icount trigger exception PC
Date: Wed, 11 Nov 2026 19:04:10 +0530
Message-ID: <20261111133411.1922854-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xf5J-82QS1KEMDzVf8LlTjFUlKdoy8nv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX33rP2b1klNxz
 JWO4qgcLGqTTdeHBT+Fl8vfOR9ESnH7R5xgtIyYJCoJqPtYTa6y/0Pci7gDs9Sp6ciKBJwsw8Qv
 1RcHC3QtnPoEpH5eMLQ125jgKclfZKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX6hFB8RGigoP6
 8jEbjo4Rxbyf3XgvIRGGLJlXTl/ruPLBAjdWcSlLz4Z9nNbqzXsaMkZ4caJn3v7WQ2k14Ci9dvD
 zqxFH6zj/9XslG9a81w8YpNCcfGA+8U3QMMqmygK2iChTA7ipHTuRBmSUkojCsvQrhnILGivXIG
 HOec0AALnCZKA2TkvBiRTRdoPIIyo5FB1gFt8pLg35t0Bn8yEMsmrFnZeF2RgsVmVGFHXx2skuk
 ONnALfS6LDJAy5Z8uAVG3q1T+KBYlwJCAvRlKAPugwpaJ6K+LtoO3QN+GGlYjMieC+hzC32/Rfz
 Wv3Qn+Ty+hzir5OKmV014/iIwWIAzn8rg0vAY1C6/cum1EBctsk4BsUh1Nk/mf2nwHRhtB/X3Rd
 U5mg2BkTpurmojvpCCaDRlqQMfFxj+W18mrJJqU5dn7tb2/LeO2eKSxQnFEUEoWaPePv8o72Kl8
 wFKs/MqCjb8qH334jPg==
X-Proofpoint-GUID: xf5J-82QS1KEMDzVf8LlTjFUlKdoy8nv
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af46edd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EwCL19PAiXdwFe56MGIA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=himanshu.chauhan@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes in v2:
 - Added fixes tag
 - Always load itrigger_enabled flag in migration load
 - Reload itrigger_enabled flag after tdata3 write
 - Refresh stale itrigger_enabled after mcontext writes

Changes in v1:
Per the Sdtrig specification, on a breakpoint exception with icount, the
xepc must contain the virtual address of the next instruction that must
be executed to preserve the program flow. So for a one-instruction
trigger must fire only after the counted instruction retires. The xepc
must contains the architectural successor PC which for a taken branch
should be the branch target and the fallthrough otherwise.

QEMU previously disabled the translated-block trigger flag when icount was
enabled and relied on timer and privilege-change callbacks to update the
count, so the trigger could fire outside instruction retirement before the
guest PC advanced, causing Linux to observe the old PC and re-enter the same
breakpoint while single-stepping with icount.

Fix this by
  - publishing the icount trigger flag in translated blocks even with
    icount enabled
  - making the helper decrement the trigger count after the
    instruction has committed its successor PC and raise the trigger
    action only then
  - privilege-change callbacks refresh cached enabled state because itriggers
    tied to privilege mode.

Also make trigger data CSR availability depend on an implemented trigger slot
rather than the currently selected trigger type, so software can disable a
trigger with type zero and still write the rest of the slot state before
selecting another supported type.

itrigger timers are completely removed as they are not required now.

Himanshu Chauhan (1):
  target/riscv: Fix icount trigger exception PC

 target/riscv/cpu.h            |   5 +-
 target/riscv/machine.c        |   5 +-
 target/riscv/tcg/cpu_helper.c |  10 +-
 target/riscv/tcg/csr.c        |   3 +
 target/riscv/tcg/debug.c      | 170 ++++++++++------------------------
 target/riscv/tcg/tcg-cpu.c    |   7 +-
 6 files changed, 64 insertions(+), 136 deletions(-)

-- 
2.43.0



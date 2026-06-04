Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CFCCD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:54:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4lE-0005TH-Fb; Thu, 04 Jun 2026 05:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4l3-0005R3-Dg
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4l1-0003gz-51
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548UXbY1132209
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=NZ6hPJRYwadJfMNp9Bnjqd3FquB62aoqSjy
 U8o3/O7I=; b=j6gpmMvh7Cu05idR+ldZHhSIZEn0dBXTGlejYW6G65nMnaBc9Ye
 /ScWOi3Ldx4+xUxnzuUblZ/UsQe2wPWblYHZJBHJJEAVGTnlnABqmDPHbEssmLel
 prXEoklqEtDZKRYBJwzwIa/ROqOJxEKsX3qINHJ8hTGaSuV+Z/LB0I1NMCajQKQR
 i5aXypvsd9i9F+sw7VLo8JGSL2hiRXWCxu74XaM9IWE3cjWagiY75lBunzvWaTgW
 3kApQCkMd65JNZDAi9FLNjtuq4TC8EkEQgenGw/yH6BVc2WeUuYpbmSc94ZEzYgl
 rOFSyN4dbXNncIkTK4UZ0moDjfP6OdpxWNA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsga83-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:52:57 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-66034c1b31cso679441d50.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566777; x=1781171577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NZ6hPJRYwadJfMNp9Bnjqd3FquB62aoqSjyU8o3/O7I=;
 b=LiiHcPCzgCBSoZdn0gKGVXfnTQk04wQSUHWFplXtX4GrRwvxKISliGmKzINW1yUH1y
 3hTYniVEp0Tr78NUy0S45R9uZIXuAelMAOH0ATgaN/bhqP/cVCZRRpTubcoOxiZvIcb/
 sFnIsLrbgKf5JgVUycCOsYl/q8ctbt+05zijyk2UH8/WLNGOVAjUyLJqWgL3kuzhNAMF
 xZIg7T/omUnJElLIpXEfn1kpjWrifvkbi8M4O53ZVGa6Wf1Ec4YQTMfoJ3vuJJJyiqzt
 LE2YAyfqFMO3euxkL6WEPJVgRcX6ky+N4eLOhbY6AEnMoqJy52U7U9EnsjkzU2orW5uX
 wxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566777; x=1781171577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZ6hPJRYwadJfMNp9Bnjqd3FquB62aoqSjyU8o3/O7I=;
 b=sTdf9ICT921gUdN1H9HxXsMeUzLKNI/VXx360VNOO47kK/E6VfOuTXRDCqrTQEHMgf
 RqdZI/WGIHGbng7Q7TPFVsfZ7JFGXHtQX6O+/nVQ0zKddUA1WwjJgf0DKfec+EElxmVU
 rpmuV2D9oLObGJcseQkXxXkNWnX3JQqbRL6BgmtH4GeaPKzAGYHGujrhn7ekUxmt0e/F
 Z1NPpAwl32Btx1UIHpv0fPUkkvYqCYuuxJfapGS8vfCMsxxnN1NWhEMgi6MuwobuASBq
 9Riv27OcTRmsFWkteKGZdlcHW/yuzePkp2uQ0qYbVJQT3MUCjd2jKdUCGZtEvGg8zDY/
 FBHg==
X-Gm-Message-State: AOJu0YxXXjPu4KE1c2I+KQFciF6pxLS3ckCmGbQ5w7J88dz94AyyPWfj
 7vHEyg4D/umMoMKDAZ+GT7jiMbPs8KLzhHHMkzPnOT2iBzuGzJZR3O26z5s4MEHc5srKUWJSucD
 50Fn32zG07lM3HxyYf7HKuW8e+NyXBBZLI9iqX1s0bpvFejTZ86R0QUBjPg==
X-Gm-Gg: Acq92OHi5QW1qJtSPPi3lmf182pR58IkueTeACpe+/EryCRZF1MpAGHQll7Rc+xu4md
 CDyCBb+Uob8CgMbYNkXM0rQ9lZSBbZmaAypHKP4Mawswr8drHD8M91Cw8ZDYYvXQ7y71ljbKJCp
 M2iQ7i/qdNvW2eRBDU4VadHY5TBoPL7pcv27/u/iPGWZPknPhjN1iCFtggj9Ixb+ymwsZ9OIO42
 1sI5CApcHEQUDYBXaKNpDMveiprOdbeUoLVqyT7LbVUVgcKvyeWLrtGAcnkUiMJkyYHeHGUBQ6J
 oIVJGg5SMp9M0FbkETOM2oZQ7wqMKxzaFfRn6lKY8iNXVagqZdpCnqzGclnkGkErDdu+vn97zef
 2U5bNs4O9pA8iG7fp8SkXLsmbHsL+whhe38Bj5mRs42kDnnOmY7hvGiZG0n3XdYR6bVnGtw==
X-Received: by 2002:a05:690e:480d:b0:65c:1f97:2c4a with SMTP id
 956f58d0204a3-660dbff3992mr3975837d50.16.1780566776879; 
 Thu, 04 Jun 2026 02:52:56 -0700 (PDT)
X-Received: by 2002:a05:690e:480d:b0:65c:1f97:2c4a with SMTP id
 956f58d0204a3-660dbff3992mr3975826d50.16.1780566776465; 
 Thu, 04 Jun 2026 02:52:56 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-660d64ba680sm3522830d50.21.2026.06.04.02.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 02:52:55 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v7 0/5] hw/riscv: Server Platform Reference Board
Date: Thu,  4 Jun 2026 06:52:39 -0300
Message-ID: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8emgXIILRq4447OCF8BheeJLyX38mMcm
X-Proofpoint-ORIG-GUID: 8emgXIILRq4447OCF8BheeJLyX38mMcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX3/iOHn8xC7Yy
 Iv26CMrJvb1k0ZlgjCiFM4f2uvPf8p7F4M2gUs4Kv3gOY+G88eZv0IrLsnfVwxVOx+n+hkOOhxY
 ++6uWtHv+W4rAR5gnIXQ7VLiolUFWD7y9qYLBJu4s4j/L8FD6kum3aiRc8GKPCBdqG1DD3iBWEy
 5nq2ZP9l1tmXL6h0TZKPh0G+GusTgOnE5dCpC6CUVjUZ6V3DZo/bggjtcGlai+J/7FItEGdZUhg
 SVNFtuaNscLGoZRyPMeVBqubZhVMuPjNerKVtY+6PhLq2QUkLjsX1GIdlUPbDgUzcHZE9yDaP6B
 Wz4guehWcvsAZP6wGDgEpw4My2a2rQJOHGHJPUnCeGmFseMOZejzBIpW3a7ncL16fy/nVXYp+gG
 sCYD12y+HXPUKf99s1aHnROrHS+MlUM4AQOsiS4qC//OtLsAmcXibqPpNYrsdoGT38YCsisHLRG
 ccZEDbORXbfeHuiM0aQ==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a214af9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YvhIPXZnleHe2a3Z7c0A:9
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In this version a new patch was added to include board tests.  There's
also minor changes in the docs to cite how the board was tested.

No other changes were made.

Patches are based on alistair/riscv-to-apply.next @2d9be31092, plus
Chao Liu's series "[PATCH v6 0/7] riscv: add initial sdext support"
[1].  For convenience this series is available at this branch:

https://gitlab.com/danielhb/qemu/-/tree/riscv-server-ref_v7

Changes from v6:
- patch 4 (new): add riscv-server-ref tests
- patch 5 (former 4): add more information about how the machine can be
  tested/run
- v6 link: https://lore.kernel.org/qemu-devel/20260514204640.2540054-1-daniel.barboza@oss.qualcomm.com/ 


Daniel Henrique Barboza (3):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  tests/functional/riscv64: add riscv-server-ref tests
  docs: add riscv-server-ref.rst

Fei Wu (2):
  target/riscv: Add server platform reference cpu
  hw/riscv: server platform reference machine

 configs/devices/riscv64-softmmu/default.mak |    1 +
 docs/system/riscv/riscv-server-ref.rst      |   52 +
 docs/system/target-riscv.rst                |    1 +
 hw/riscv/Kconfig                            |   15 +
 hw/riscv/meson.build                        |    1 +
 hw/riscv/server_platform_ref.c              | 1373 +++++++++++++++++++
 target/riscv/cpu-qom.h                      |    1 +
 target/riscv/cpu.c                          |   12 +-
 tests/functional/riscv64/meson.build        |    2 +
 tests/functional/riscv64/test_opensbi.py    |    4 +
 tests/functional/riscv64/test_server_ref.py |   57 +
 11 files changed, 1518 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB61C79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 21:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4PWb-0000wB-Hp; Wed, 09 Sep 2026 17:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWZ-0000vd-OF
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWX-0000V8-Iq
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:07 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JI6Ti3710919
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 21:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=NBFXTawJFBfGX/1STSOs3Llh5052l9w32gR
 ZP3mKSIQ=; b=VfTChepwn8WE/sobkiS1EkAC/SwNqdkrj6CHZ6keZIENiO7mmU+
 hOZoCaaA5G4V1pKh+l+uvVbjxH+x5f4T/Ghp2wVQBSYVNJGW7RAO6xE2LbpAfV9i
 uDoswE+I7LCCFmAJ58tRIeSdYH3KIRPcbGceizlrO8/WZufRlHgUEJVm/kfwikTv
 SUIRzk73uIypxO6AoviCM8Tw15DPirByOvXxDQccW8tBGjsYHmRKTQ9ovWm2rPsF
 DaL3iqjIhRQWZ130Q/sEm00eEqMxo2yo4pJCyTtqd7HseOz2fxigTlp0kvlVeblw
 +gPVrDk1hjly1GG3e6yS6xjvH9XcWiNasvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydgkqg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 21:08:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-934963b2bc0so1259323285a.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788988082; x=1789592882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NBFXTawJFBfGX/1STSOs3Llh5052l9w32gRZP3mKSIQ=;
 b=VvN5ne9P3TLF7ariU0U6MP9IuMAvzXXTmf2/j6kudOkJsM3WaxbOVf6cRY2hTNj/qZ
 SVJ+Mpg+zZkcRHHekHn1wlVoom1H3BNo3dHinJ0Q/iI286PCRMlR3isAQ5nam91d/SZB
 l3JCYwqDiycC6tRhMzvibvB6bFW5L8Xbi6/FKkJTndvHB7ExVUUXSGZphlQ5Q/3Q7vpu
 aASvbi9XcBK2got+CYgKBt8wO6LdDy1qgTOW6oF1Lh0QeSsZx9WAgtJ9cZuvs8PioAvd
 JIyrQaX0GM6RzG5/A3mqqJ9/DGeGXDyR+FkBgX0sxyE7/jqgwejakaCpW1i/JSy3h4RL
 5dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788988082; x=1789592882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NBFXTawJFBfGX/1STSOs3Llh5052l9w32gRZP3mKSIQ=;
 b=FkCysEc/LY5ltIw7Zp54NYyXxYMaNP2jlAb1MZYlR4jtCI/8e4sw0y0rS/2NeiVSbt
 a2m3bE7xq0WNZjGCokNAgsHOvrXrvNNYVUkZTaA0Z+GQiLhJiLyZXVSbzZGDaXBESM/0
 tuIVje7jihdH4FW1MNGruWIInEQgXS1hvxb4plsuN5HXuSr23x7XqDqvIqFhSnwVHYgV
 V+uUwohZfQCdLKr1F5EGV/EXEtfXQMd6Q/uDOM6D7tB4jHYc+y9a/H1AFgUL2WODhxtG
 41dHGKG4fqvtFtBpwNgIfg5hy/yUIM9YG1ScBMw9A/uaIOZDtHYZPiSrcdcLAaQz6ytt
 cfbg==
X-Gm-Message-State: AFuF++mAEdsyJ89Do3VBu8PbjPhsu5vJpgYu/L65W5HHRtoi+z/O269T
 0U3/keNTEE0zx3oEaULMwa4HHTXrWzkDw0afEwPiyD+HmH8kARaMtH0djrvWod3pC53N0V1iBBJ
 lLEByG/eEmdE7LERcMNxZM34k1Y6fyBka0Tw+xE9fqU3sp3LK5FtIKJpSXA==
X-Gm-Gg: AYBFou1CiXZKjI4ASu6/XH203FBe0tUB4wq7zXMbbuRhnVKk5h+USBd6YU0FL37Sf45
 i2BcsT7g7jctvHlbfSVIvhB5JnnW26Z/lHramDFUfgv2/sm0D5QCzh5S+pAYoht4r14LLKHPsKI
 JaZb/yyx3ITyimiw22Sz3SOZ2eK3/u21BEAUHNngucNN5nx4l+z80u8Eu0jHKhQRVfwqw9lkOF1
 LElrO+CrJtbftq0ONqK7Nn30Dl2lydC+ObAvjblDGd4C6bjIT1pHdHPENJudqjIUfLhVr4wxY7c
 rAPEiWMT95xJE2eN0GCDmakDJgCeMxNGdIXsVhhAQfg0hmWzrF13kGbezLUhYch3TV3bnHfWpRG
 EIhvF6Bvq+vns0nWw6t7kEkpxiUVj764biOJo
X-Received: by 2002:a05:620a:29d4:b0:934:9524:2e89 with SMTP id
 af79cd13be357-939c93ce8ebmr1139827785a.13.1788988081865; 
 Wed, 09 Sep 2026 14:08:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:934:9524:2e89 with SMTP id
 af79cd13be357-939c93ce8ebmr1139821185a.13.1788988081343; 
 Wed, 09 Sep 2026 14:08:01 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040646d59sm151811336d6.8.2026.09.09.14.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 14:08:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v11 0/5] hw/riscv: Server Platform Reference Board 
Date: Wed,  9 Sep 2026 18:07:50 -0300
Message-ID: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNyBTYWx0ZWRfX0SGzAWrSzeKe
 rpJdQR0Rr+r1apM5Ds49UfTpE/CLnyqFGfCSeZ2ompNFm9Hh7EkK0BNYvzw9uvsBXmDATcGWFMi
 MlOcV0H9Vsx/oJ9CPXaQ3pVoTh8dqFg=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa1cab3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x26-pumYbLzhefK_VDgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LrDxam3THbzvKd1SyVReONe8NuCASQ8z
X-Proofpoint-ORIG-GUID: LrDxam3THbzvKd1SyVReONe8NuCASQ8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNyBTYWx0ZWRfX97oS0LyoEgf8
 0S206mXoXYEmbou8H5eAvtSDnCp2T0dc2GBKNZg06bq+otaI3Vn2QPa/LS3QA5zmWnSROof6My6
 R2GxjnKkUJj9quWa7L6azaZN4n/i2e4C5BqRIZr1uM7xxya98O7Oz0U7HLxaWvf8nLZbIFrre11
 nh45/mxOHEf2Uf6um8M7jmvhooyn2G6ERL6p1YO5mTpx+wxHiJgKhj3RSZtrVFJmwzTPvz3oOCk
 HFdcQld61oI46YKC2QVukVZ+29EVQz9PEexFv3huD6W1wltnJy79om5wgJ3ICd5zN++SMaJ9cTx
 pQg16qRu3LfHxfSs/Zkz62Npun9Tnw4yr2ZtgVgWkDGb+QkHeVK+uwhCfpTlG4YX7RVL99hQzWr
 2n5l51fT+1/UUiojbCA7TvwNAwiR3Q/VqRdaJcgKnEpBf+4MeNh1mfsrDbLorFS4P+X7aZ//F6T
 nx2g6QJsMYAUKxn/rTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090237
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

Greetings,

This version has review changes proposed by Drew in v10.

Most notable change is that we're now defaulting s->aia_guests to 5.
Users can set a different value N using the already existing "aia_guests"
machine option:

"-M riscv-server-ref,aia-guests=N"

Docs were also updated.  We're now commiting to do a new board version
for every riscv-server-ref spec release. 

Patches are based on top of sdext-v9 patches:

"[PATCH v9 0/7] riscv: add initial sdext support"


Changes from v10:
- patch 2:
  - added sdext as dependency
  - renamed profile to "riscv-server-ref-1.0"
  - reworded profile comment
- patch 3:
  - added RVSERVER_IRQCHIP_DEFAULT_AIA_GUESTS macro, default value = 5
  - s->aia_guests is now set to 5 by default.  Users can set a different
    value for testing purposes using "-M riscv-server-ref,aia-guests=N"
  - fixed whitespace issues
- patch 5:
  - reworded the "versioning" paragraph to make it clear that every new
    riscv-server-ref spec version will trigger a new version of the
    riscv-server-ref board
- v10 link: https://lore.kernel.org/qemu-devel/20260904195610.964829-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (5):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  target/riscv: add riscv-server-ref CPU
  hw/riscv: server platform reference machine
  tests/functional/riscv64: add riscv-server-ref tests
  docs: add riscv-server-ref.rst

 configs/devices/riscv64-softmmu/default.mak |   1 +
 docs/system/riscv/riscv-server-ref.rst      |  65 ++
 docs/system/target-riscv.rst                |   1 +
 hw/riscv/Kconfig                            |  16 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/server_platform_ref.c              | 790 ++++++++++++++++++++
 target/riscv/cpu-qom.h                      |   1 +
 target/riscv/cpu.c                          |  33 +-
 tests/functional/riscv64/meson.build        |   2 +
 tests/functional/riscv64/test_opensbi.py    |   4 +
 tests/functional/riscv64/test_server_ref.py |  88 +++
 11 files changed, 1001 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0



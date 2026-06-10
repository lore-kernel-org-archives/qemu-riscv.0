Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBDDCD98C5
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 21:42:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXQgP-0006nq-OQ; Wed, 10 Jun 2026 17:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgN-0006g2-G2
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:41:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgK-000314-Uk
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:41:55 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AJZ4bR2602029
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fr+hmP6wAcyJg6fA0k1Ejn
 Gs7psf8eLT4/6GCio/uCU=; b=LtFfjLJa6IVy++vwqhJzlnTZ04K6XoG9spjxF3
 yCN6bPY3gpuMWrMmtc8Fk8VLyI7oHLWL+28bUvApDarAa37nFK/SyclpyziiYeZ1
 1u4gyWh5o885DvoaAG/aF8dU87jL5q5KpvEFJg7xK+CwPtWE8CcbxBT3XP8HZXtl
 qqbSBw58ElVgh2igFMTG+Y/aIkplAc8BQi/qgXqLDoRJc/h5oVcSHsvuouIYa61Z
 aYf8SKYG9hszNDEVt9A7nUm4AvhQReeqSr486Sib6TmIg1pI3q3yEW2Acs85UNX4
 BUNinvJJSTIK8gJQst88V5E8Kp9xZT8VjFP5ulNziJJtDFzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe700exg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:41:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517c65c019bso71050631cf.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781127705; x=1781732505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fr+hmP6wAcyJg6fA0k1EjnGs7psf8eLT4/6GCio/uCU=;
 b=knj8z5UI/JDOEtgsFF6d7jou7V1hAq5UHz8ORV24GGLH/JxBtJRP9QrV1zjWTcCoyJ
 bjgd0wkMjb1laiUmk147peOHUkre0jEAr4HUGxVKm2RRxuiuc4fORRMYUsby8SWy0jYZ
 dksgyGi38S3hKy2G8Gy8xGGB27bpe4+2woWnmcw5/5z3aTASgJgoEeqnTc7qWtmtnR4f
 b2xpxsoVl38xF6pjRsIycaJUr2kHQoxUi8lhQaese3pJFMh8nCtuXyb3v/VmcoGRUiOU
 BXtVrcdLKZYBUtc9ey271Pkeu1RmbLr9JcosDzdq5IrKC26ukXglodMYah6jP2RM76bY
 GCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781127705; x=1781732505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr+hmP6wAcyJg6fA0k1EjnGs7psf8eLT4/6GCio/uCU=;
 b=kg35d2OaXPo6VWRkMbb1RMxsOUJX6h2bGczlZolyRzp3fpPEWsXJDIks9VMZUZNqg0
 e4TVgESnUgT2GUkBVBXTcsdCQb/LoQjgexbkK6jgpk0vMDDajTLbfXjkt/PH2uPdHzkU
 pS+Ew13T2wogqONPb04UqRZWqJVY6PCpDRPlmvaQHZxUNzYdLtW6Eo9VP2t1Zckk7neL
 4tfgOFgAlQsTmIoWwVqH8my93ipjECcwzdS1b01xq8RJv61wmPv6TWY/uj0r/eq5rJBu
 b1vFa/EEjBPxbexMH0YdckgPgKWLFyipzySd3DRCGIM8FZcSr9jIGLfSS88b73Okygng
 /yIA==
X-Gm-Message-State: AOJu0YwgbYWWQXybZkeRTiMwLJR+x8C66r53flYStc0FkkhvPV5fAc/G
 qurejKsreeevVca/ZH5EBrBk5/yBGeh/blWOYQ2So4V6x9ggaHnuA8fAQAN6hSWJ5AKc324bT1y
 1dd4S9IjsQpjnTrpPizHuJYZEAOY92/jpZx2lsVfM6jDT+xjmuF192f2Lmw==
X-Gm-Gg: Acq92OFsEyAwalJglzEU8BcAf8ZU6icAm5A/FTbSdJCiVb3mefBbs93Pu0cOIdKFzg4
 YRdApjuz/mFa9rbAH0mx2V04O3bGEBneO6UvGP7NHqqwpYKWRoa+eZV609CkRM4o8zzJVco0a0/
 9MnM8qE608wwsrIc2FyvGewziRMYeAZ04himnTJPJAjviE+EW0NkpNNaaGp+0dgNIgYecu1Wfhk
 uMSFC13xN4Q5xuTnrVvfVoBV+EhYftdC4zW0twKF5Gee5b+qqsZFdYwn+FMivkumg6XxcLWhUfZ
 vWnptT4iqib++XsTpJr2bVsml+oz8FAVcdxpHBRHLHB6s1AQstUPV/i31D8i4FnNI0DCC7Co22F
 ZyVX3OJ52kIywBgeY51hQjfaIP7UnpKBEHy1MybZkgiz36wThfPqOTx47q9I98jujxSU+Sg==
X-Received: by 2002:a05:622a:2616:b0:50f:b904:454 with SMTP id
 d75a77b69052e-517ede3fc7fmr1364551cf.11.1781127704660; 
 Wed, 10 Jun 2026 14:41:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:50f:b904:454 with SMTP id
 d75a77b69052e-517ede3fc7fmr1364061cf.11.1781127704154; 
 Wed, 10 Jun 2026 14:41:44 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6d777996csm20766280e0c.7.2026.06.10.14.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 14:41:43 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 uwu@icenowy.me, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v8 0/7] hw/riscv: Server Platform Reference Board
Date: Wed, 10 Jun 2026 18:41:26 -0300
Message-ID: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aAvDIJgxs-r-hzWBmsNEUJZXt0UPhICc
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a29da19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KcQHL849TJs2vjbMfwwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfX0I7XiY3qtFko
 rhrtGtHy5FocmUaPSnj/yUzAG+BxLgybs9GpKNMbGdD6Sfs0GkCuy+0Tf3myVqlFKzN1yWwWuyu
 8r2g5LsokgsVJ7NUfReUT3MT2ypj/UXGZzU2oEwXQczP/urELeLUAMVM/9dprennDShNenALlJ5
 aDPueRDti+YkmPnA0vfA+m7tGFcgXmbM2sF3jGSMR5kX3g7aOZBBzI5bxLiUeelyw0LQH0/F8pP
 N7NM73ATEvxTIElziM8zU9CkPMelM8hvsClHt5U3mLnvI9Mi3rQzbFPb9gBF/8n1ItqUPZoqmLy
 hpLD/MQ3y9FuwGbHK98ZJLfXxuYx0qvEInFdKPudFonLFVMmCDosKc6+Cx+UG0I6Q+mBUaE7DiY
 uGoUwmyF6mq0aZDAgcHJ8hNXw4Fyl9p+M3FOTEBpk6en4MNUOjVef/28+lRVjKTMF+pwVNmGOpA
 B76w/9X/FnDRajRp4zQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfX24c9za7CzUBh
 aVvm+csbG+Cm8QWsKWpGJlZeZAO9Em6TjFsr7+MCIKS+AoQpI4rgzY+3zdoy15TSyrm0ebmpUCc
 CThmE/+gKc4h2e1SoNjnBZSHR9Vucg8=
X-Proofpoint-ORIG-GUID: aAvDIJgxs-r-hzWBmsNEUJZXt0UPhICc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606100207
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

In this new version a lot of changes were made.  Some of them based in
the reviews from v7 [1], others from a more in-depth review I did with
Drew Jones.

The most notable change is the TPM support, missing from the previous
versions.  Turns out this is a must have for the server-ref spec 1.0 and
we can't miss out on it.  TPM support is added in patch 5, while patch 6
changes the existing testcase to support TPM.

Adding TPM support required the addition of a platform bus, and with it
I realized that the board was running an old version of aplic and
imisics DT that were copied from the 'virt' board.  With this
realization I did some fine tuning in other DT problems that the board
had.

Finally, in patch 2, I'm following Icenowy's suggestion and the
riscv-server-ref CPU is now based on the profile engine.  This change
fixed the satp issue we were having in v7 without the need for
additional changes in the base code (that I'll end up sending anyway).
I liked the end result but I'm ready to hear different opinions.

There was also another notable change in patch 2, based on another
realization when reading the riscv-server-ref spec: we don't have enough
debug triggers.  The spec requires at least 11, RISC-V CPUs has 2
hardcoded triggers per default.  I am solving this in the base code with
additional changes [2], and after that we're now able to add 11 triggers
to riscv-server-ref to be spec compliant.  Additional triggers can be
set via a new property called 'num-triggers' - see [2] for more info.

What we're missing here is an EDK2 compliant image.  I am aware that
there is an upstream effort to make this image available, but I reckon
such effort is also reliant on this work availability.  I guess we'll
keep pushing new revisions of this work as long as needed until it goes
upstream, and update tests/docs with the EDK2 information when we have
a eligible image.


This series is now dependant on two not yet upstreamed work:

- Chao Liu's series "[PATCH v6 0/7] riscv: add initial sdext support"
- "[PATCH v2 0/2] target/riscv: parametrize debug trigger number"

For easier consumption this work is available at this branch:

https://gitlab.com/danielhb/qemu/-/tree/riscv-server-ref_v8

Changes from v7:
- patch 2:
  - create riscv-server-ref using the profile backend
- patch 3:
  - fix aplic, imsics and iommu-map DT generation
- patch 4:
  - change test_boot_linux_test to use a PCIe AHCI disk instead of
    virtio
- patch 5 (new):
  - add platform bus to support TPM (tpm-tis) devices
- patch 6 (new):
  - change riscv-server-ref linux tests to test TPM devices if the host
    has 'swtpm' support
- patch 7 (former 5)
  - add additional information about TPM support and command line with
    AHCI disk
- v7 link: https://lore.kernel.org/qemu-devel/20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com/ 


[1] https://lore.kernel.org/qemu-devel/20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com/ 
[2] https://lore.kernel.org/qemu-devel/20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com/ 


Daniel Henrique Barboza (6):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  target/riscv: add riscv-server-ref CPU
  tests/functional/riscv64: add riscv-server-ref tests
  hw/riscv/server_platform_ref.c: add platform bus and TPM support
  tests/functional/riscv64: add riscv-server-ref TPM selftest
  docs: add riscv-server-ref.rst

Fei Wu (1):
  hw/riscv: server platform reference machine

 configs/devices/riscv64-softmmu/default.mak |    1 +
 docs/system/riscv/riscv-server-ref.rst      |   62 +
 docs/system/target-riscv.rst                |    1 +
 hw/riscv/Kconfig                            |   16 +
 hw/riscv/meson.build                        |    1 +
 hw/riscv/server_platform_ref.c              | 1477 +++++++++++++++++++
 target/riscv/cpu-qom.h                      |    1 +
 target/riscv/cpu.c                          |   32 +-
 tests/functional/riscv64/meson.build        |    2 +
 tests/functional/riscv64/test_opensbi.py    |    4 +
 tests/functional/riscv64/test_server_ref.py |   88 ++
 11 files changed, 1684 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0



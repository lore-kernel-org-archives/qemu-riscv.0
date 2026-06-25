Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE5CDE00B
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 21:09:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcrJW-0001Nq-OW; Thu, 25 Jun 2026 17:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcrJV-0001My-LQ
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 17:08:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcrJT-0000WX-Nu
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 17:08:45 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65PFe7Lr2192123
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 21:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wOAglh9JSHwEYh42iqkguXlvVr5dk+M4RUH
 43WG0Gio=; b=p2vFKYXisiv/NqjfCvgO/6StEs7bNPSVugrVL2ZALG7wgmtzyX7
 /g1L2ZPKjrJEUY6FtWpj7Dtzm/r0nOIbbj+ymr8wuXVxjbDKd6h0Q0T7jhZfrNBK
 9trMG799SQQCC6XNrg51kRL5QPgWPYVr7UbFMeVppPH41/MyrM4Y3KCRiRUz0nKs
 3UkG/uXawlsHOmeZfX1k7+t1GUsWt4GHrL0VRvGnfzrR86mKqBhvtyvggVfwwZO6
 lNTSTh/V6N/G/3bQ0WPYdD6XfNgGXHP0zbHc4OmZjcrmwhrVdHUiOeOC4FDXxkVl
 UB96yAZ/MCIBAAV0bUI4gkb3UpoFMDT5vPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudm7d8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 21:08:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91e59716176so44325285a.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 14:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782421719; x=1783026519; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wOAglh9JSHwEYh42iqkguXlvVr5dk+M4RUH43WG0Gio=;
 b=gX3TVZvu/Q5pxMcW7f5NQ2D77PWi1FXoONXAeW8tjXefWmhb+qCD9lFqq9S+e1TigY
 zKNlLO82S1eIUX1KWwansIJs2Zv4552SWLyH5AiquhCnvVkNxFF6h9X5NcqWFHudO8Z0
 8EsoV5OtixlD4bo5tFBTBf7fHlgH83nwflLxoM8l7DahaaUDCDPstrerxI73W8FvjAkU
 eM5nyx9nEQwjYklr+XJZIGmAcyfT56bjh+Mj3IHfO5b53e07xKiCoNJzj68myy3vc5GP
 fcaU3FVUBcEuFcV9ahhloynpL3CHhxZanu/YU0fNPzsQngysgmcdOt0/bBlF5L42xvJT
 RNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782421719; x=1783026519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOAglh9JSHwEYh42iqkguXlvVr5dk+M4RUH43WG0Gio=;
 b=dfW5NVD2fen6PS1B5jwES820JSoW5JEspkILP7u6xxKrl7ZMKevrOFgEKB6eO136LV
 fGCWg7RmTEeBO7mPrY3rK6kx7LXEUy2uQKpdlHi6Ueovi53ULsw7QxPtQRoTJsRPXU2w
 qb8+DPMwmXe7GivApOAUXwijYdbPVVNYAlwXTdVqXy37SP9R5v9eHV9Fc/5N8Jbw9Fhj
 kX2DMD7B/ompH3vF/on5VFQJH+0n3gf0JhJuohuLEnwcP0DBrApa7GpYv+HRhI04JOt8
 aI4yBSpH3o+J8gJd5hQe2gDvxftLAjnw0hpFEDhiXrfXLxzbsqDYi04OZ4CmQhYeRJX1
 MqKw==
X-Gm-Message-State: AOJu0YzkzzidtJAtvu85uiefvjiCHv7N/lM/4GA6lqYG5JmM0GvVSmgI
 +F5XeRzXjtwNj7hTe8Av5irlU0RWsHine7GFIGoD2eLzEqTRy9TcYJ7B7JBAaAyrj2v9I2CMAIl
 JvpA012kxK1etyQVvNYXiM/TLqxgNBYqvGzz0LCoyTq+wyWdjRbKi8ywtRw==
X-Gm-Gg: AfdE7ckzkksTSx3es/6eB3nHKR9yDgxF8VlbDTOW5ni+o550ZEuWLirXqdXCumqTqt5
 qOhx9Z172WWe7S+yPaW60R7QqEwbAmtvETmojCy8xelrz63yJ0tcUWYqP4smrEFblW4IWcT4SH+
 5mTlPqWmT9K2wqmf/oUkDaWHyGl9ifo0r7HK/sdC2AXeBNc/Q+QZboXuoCW+BvrtifaIYl48zAh
 miN+7ORzkN6YEet5guSCoRhIGCSD22unPgLJuzeAvf7taeDci0PKdjawN6o48z7GgrQQ1OH2jM7
 mL1NJN9XTwf7enSaCoKLAKTCDolAtpIVsCgrFQC+OR8bSiZ05SWhX4jWQolG6T2RivVjWCzIiVO
 zh+CoYybzgCOfDZ+1n8icMUUNpqJaX3X9BBXOn9eOOdLNXQ==
X-Received: by 2002:a05:620a:1a28:b0:915:6a2b:6265 with SMTP id
 af79cd13be357-9293daac958mr684274585a.44.1782421718493; 
 Thu, 25 Jun 2026 14:08:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:915:6a2b:6265 with SMTP id
 af79cd13be357-9293daac958mr684268585a.44.1782421718032; 
 Thu, 25 Jun 2026 14:08:38 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ac1acsm920733485a.32.2026.06.25.14.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 14:08:37 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/2] hw/riscv/riscv-iommu: gitlab3576 fix
Date: Thu, 25 Jun 2026 18:08:31 -0300
Message-ID: <20260625210833.3294437-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE4MyBTYWx0ZWRfX/1uY2sCTbu97
 wOKCYGBfDtlC9KrBgbw55YvcgOEcjVoe/mHnMT+tizzM8gV1cTZcN6/L1WmSLZM934wK8Icstbl
 fGu4CR6sa9xT852TJeqLa1ngEipPsIw=
X-Proofpoint-ORIG-GUID: Rk8LMgrTPQwVam04MFU7PjlBsSggirQj
X-Proofpoint-GUID: Rk8LMgrTPQwVam04MFU7PjlBsSggirQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE4MyBTYWx0ZWRfX39m9vzeS+KBy
 uFhWegEl4KfkDxS+F2IiYlKYwKE8f5rnC91dT4ssIIBZQ9QmX0825QPvJDbhpFN7JtxBlPjocjl
 oxe9nU+dzFXQRytYdpeSUg6/dxx4uoFo671gJMcngWXXITHJx+eXboBytLyZ+dO05QySnOIL5F+
 OPEm3w09UQ4hAS1Ot2YoedXHJmEHH1QEpBMkbajWn+wkbrV4q76pzEjBvsszHlIpXtKwKiJs7YB
 DBjrd4UW5RJA6MvmQK2j/Gn9rlfxXSHEwPxZ7n10n9AOHgIESHw4sQi5Xmid7bcPqDUnZorcwI7
 wWocOi5tt5N03WodSOhWM2TbkWGBYSKiF2Bwp0Lcuv7hAt9jMoUhVTZXVTT/LxeQvO9yLt2EV7J
 rdzN05Q99/bb8HkujNgJ+8Sua7520zU0VM8ihb31iFVEu8DzUXcZrEI3vPWN783A6z60p8LGASG
 WezeGtnNKOJv4IaDksw==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d98d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kIApeaUeVm8R5dszq7MA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Hi,

Here's a somewhat trivial fix for gitlab3576.  Patch 1 is something I
decided to send because I got misled by regs_rw.


Daniel Henrique Barboza (2):
  hw/riscv/riscv-iommu: rename regs_rw to regs
  hw/riscv/riscv-iommu.c: make FCTL.BE read only 0

 hw/riscv/riscv-iommu-hpm.c |  4 ++--
 hw/riscv/riscv-iommu.c     | 40 ++++++++++++++++++++------------------
 hw/riscv/riscv-iommu.h     | 26 ++++++++++++++-----------
 3 files changed, 38 insertions(+), 32 deletions(-)

-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D61FC982C9
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 17:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6t0x-0006Ay-Je; Wed, 16 Sep 2026 13:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6szv-0005ki-72
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:00:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6szr-0004B4-Ql
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:00:38 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeH5d3107233
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pppbp0rBdi/3nWbSpC3tIuGWKziRTuC5seTvxJPNyz4=; b=H+l5oPUZtyFTvRnL
 LfLjfRuGmOwgtQxtFSFT/BST02vv/9z1m84yeeOHopRjAQ221fkw76apOKgH3FcY
 SNc2m0I7RpIyf7yrB84trtZM+6X5QhwbLm5fcQhxzyCnb8bYmRfoJkKYhU0Bjt+b
 b2B22ZyvCUEJ9NHhkUanWpxLr3jFJ3HEJnsyCpvFj9aeoDtw9igo895Wc6QrrDkE
 DJCyfIcG1hn+eFUagqwwgn7P9wviVYnXRKukWWClhcrdwI3Pw9dkz9/6w4oJIWXT
 G3HPiJMMdoNacrc4TfxuaRM1780rGJsd/tKNZS/9o/11reDcbLfTqQ/QUofGYhxU
 pDLBDA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2s26m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:00:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-39e25a5f6e8so1225711a91.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 10:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789578032; x=1790182832; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pppbp0rBdi/3nWbSpC3tIuGWKziRTuC5seTvxJPNyz4=;
 b=AdsEKq10kiAlyQbcpZIlz0C2TproKJL+5onWw0NMneOtMToSUP6zpKSPLZchIF1MB9
 QPrhHAvPzZDkhHt3x+OP/5n5/qcAobiVeTo5j6uFOMhNC7urasq09V1LxFkw44sRRkUi
 xOhma36xyGZQkimDO0mhppWq2Z25pyPbWLR9matMH/z71QPcEyVaksrGDrSgK5OpnHnZ
 /yAlAC52UDjHRxSWuNN1c16vQtEvJHVyB1zTZ0eeJY74fuNmtz6Jo/0MsgrDpyEW+ME1
 bdAMUK5btP06rw5bq8gUscJLHmaXnLltBaBpCQBGrDpZqzQeqiToA5M1wJY3FhShH1nL
 dgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789578032; x=1790182832;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pppbp0rBdi/3nWbSpC3tIuGWKziRTuC5seTvxJPNyz4=;
 b=YSkuVH4XdiVCaGBS8Yvfdr1EMnv52ZpC8/Bs987ZSTVSBcvwhgBDQnZX9FrnWVmfeT
 ToqkazfaLo3+IKioMoC69g10DI5VPpfRmopve19tVY67L5eTeQ6QFuTpHuDvoRQIqPRj
 PHZ1peVpUTwZ37C4L81GWdVXJUkumhT4bVfrd1A+qo48Xvc8JUIXFVrTor5263eCz/Uq
 vsSResDPh/2HCzq4ro1kMAVdKip1tuf/ygBHZMmu+6NV/y/sPW71QCVyvwWE9sgD9HPi
 d85B4c6WaS0qneJNddRyRWK+o0l3BOANJpuEBFPzfywOq1bRZxqgjlewrbbS9uzPmvE+
 jR6Q==
X-Gm-Message-State: AFuF++mXi2BfUSAH8P/9H+U5g0yPXDMViyVyqzq22g/irEIQqXJbKx0b
 J/ZnmgC3ORzcYMlvKgUupMByMhmZ8zdW/VG+wg/kmMq8HqVL8gqL94/0XPkrHiKit3ZTnjKC8dI
 0rMwYY/8tvhB3NDAa4W2ahIibi1yuUGYgyN50wlQtaRDXdFbDyftONp7LKC8nzPKuxA==
X-Gm-Gg: AYBFou1LjWVcm98kY1cO9TO+FG3N0nohvH+Pt3rZxux5r+AmZqdqf2KtVeukzP9A7N2
 5wNhawTsHvUnivfwPCphL8adoqmWcEavvC9GlCgxdTVQDnQRGzpHyqwP70FKW8Up2jhjbGrejbd
 TtAGJuhY8PTIR0sdenO+mxk1UGsMz9Qunw9/TygJbsOCAzdxlwtV5jN607femDvZDxaa4v3Eesv
 r76hVfcNQ0RTCiwg1Cu1wJFNLpZUWusgssThiISDZM27gZoE7wwNU5IlcKxp2rYa+BRj4IvYrKX
 cyfiXjJJ+IY8eWpM/4E5RYT3OS2mVyM53QvbuGE7PjrSdqc19Um5QxyCEwRuPr6pPKWRN+LBJhT
 FhE6/VjxLXbUKhjZKr0dW8aKSmMRfJs9bLctjwtqCL1YX0yPjFRCrS+jvVW0eQF5z0Nbo
X-Received: by 2002:a17:90b:2cc7:b0:39d:f5ef:b1d5 with SMTP id
 98e67ed59e1d1-39e1e2bf2efmr7923556a91.7.1789578032352; 
 Wed, 16 Sep 2026 10:00:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc7:b0:39d:f5ef:b1d5 with SMTP id
 98e67ed59e1d1-39e1e2bf2efmr7923456a91.7.1789578031824; 
 Wed, 16 Sep 2026 10:00:31 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5ad6b9dsm8887116eec.21.2026.09.16.10.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 10:00:31 -0700 (PDT)
Message-ID: <17543b6b-4d68-44ec-85de-c1cfc6165266@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:00:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] hw/riscv: Tenstorrent Atlantis, use hwaddr/vaddr
 over target_ulong
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-8-babc367b60f5@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916-hw-riscv-cpu-int-v4-8-babc367b60f5@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX0f6zMMW0f/ka
 jpVpjpQuMjGkGOBJLovQDHFlPZXQbkmXkobKzT5fbLe7WqlYabLzZZIqtwr4RzaGNCbh/QBWRZC
 MNRGayn+YKkXR+K3U6wWv7VmIEmyP/Q=
X-Proofpoint-GUID: KnwgiyIL0HuobZaMKCRb_y7bqRm4pmRn
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaacb31 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=esOS7BOXL8Fk7aLo610A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KnwgiyIL0HuobZaMKCRb_y7bqRm4pmRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX95BRnY2l8oo5
 GM8IsHw15+2ztY+5IcEkdo62tB74BADoYFlZ1wCwzryv3FR/mstZDlOOJwAsFcNd5Lxr2AnviHR
 bck6mtgb0lGhCxm/hr3Nq025P7QeTxUiXT1sGvR3hbOrG/2kDx/GN5pqueeoRSMRtfB32N76N75
 d9Aa8ix8i3R8qEnKUj9X/Vz4xgHTrmaidxoQ2ftGe5lMbUAhB88WedUruU9aB/XxPA7XHEv7G6J
 o9tVXMrspRL9MRDlson8A7piZ+zyaT7kLeSnNbLOXjoFSraMiUdf/NjyWQuSMyM3+DPWLqf3e0x
 D0+gZx4fP6SL5ydiuCEPR48xEy7Wpc8IONZf4q6+d/K0yTIs7rcBf3pai2G9WQGmnf3ly4dt/R2
 F3+VTPgsnIePr8JjnQG70nrbe68bT4NanLvegD1TqKFB9HF8nFo5yjFGA4rc9luxsXG7CQyRJR/
 putdloXc7CZ+s4Ujq7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160233
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/16/2026 2:19 AM, Anton Johansson wrote:
> Along with making the compilation rv32/rv64 agnostic, this also
> matches the return types of riscv_find_and_load_firmware() and
> riscv_calc_kernel_start_addr().
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  hw/riscv/tt_atlantis.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


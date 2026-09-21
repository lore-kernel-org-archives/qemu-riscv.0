Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E63C982E6
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:52:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8eRS-0001CN-CR; Mon, 21 Sep 2026 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eRO-00019S-PV
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:52:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eRN-0004dX-7D
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:52:18 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LDokdV1495056
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +PltYelwuvegL5nB9DOSitBw7uB8TWktsNrRIT467U0=; b=jKjW7fV/6XMar25y
 JKKRjCIJGmcJgfQkFwLk7H/TnQblt1m7VYDevkbMxnUcxE6htSKO5ZjyvbyyGbJh
 KeJ6kF4pf0rpq5UiZH8ieFdtqo/qFMSvlSGSy2h4nxvsQX5U7b+YPfkXXSImblND
 OL8p557ZEglHUVNvi3CbWAR4NeDdYHf1NJ4PZwn4Sd2ffscfi2vrXUaVxtK/239N
 Tv515o/uMPZ1mRpvOGquALHJfjTk5HrjDXcqqP8laveQE6V9aEHWkqceCLC2iKtT
 cVqMK/r/CMHnwKvWjDnoupFfZcPsh6eTVCntQjw5aRl/R8fbb8XUiRCu+YZ8/I3b
 kne42g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgmfs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:52:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-78fbc5a4cf8so3912481137.0
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789998734; x=1790603534; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+PltYelwuvegL5nB9DOSitBw7uB8TWktsNrRIT467U0=;
 b=GmrKjkhSSWg4O7j7Mjb9jbqczfDqYbXeYRMtm8WFZ9RWIKp1v+mqDmQLygyhxwHqqu
 F+l+WvlCRBqW+a7C9G7EZwOd38FNcASz2e2VigLPks//gWgpb/s4y4o48CGcUU+XAdzM
 ctX27HmMFu5yb2Cw91HO6dhAEmhevF9p2TXTPZQ96V8CLTP3260PZWalbqrCyiuxhKPg
 QLnq2gAoGMWp4IxZ7HyoZYE+AiVQQI5RJt/l96QsvfAqXkYI1gSgHYek/8R3JK8elW56
 3SKH41jJjjQBT0m9Ym6SyTzPLgd/gOXHTh5Tw/B6eB4WihyxFTVh72k7Cu35p9GPVQJg
 V7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789998734; x=1790603534;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+PltYelwuvegL5nB9DOSitBw7uB8TWktsNrRIT467U0=;
 b=SKgF2nflmaFvCxUW8k4dmqUDPeBEDpweJ2xQ5fEz+yYVH61uHhlCdHOlQ491ccinIh
 Hsjn0Vc4H7OMpwi1LM+LqTbH8/zaqAC+XY7g7gxzKfSOSf+Uf6pWiEtxMIdTU+gnMXtd
 +wjgHLIvb3VK9uLiEXARsY4y/gALjhygFrndapg5d0xo26JE+gNFZRrMzYZ0o2ZChF0R
 k34Dz1yL/sgdbH+EOCXnokPzatRlFZkfvbqlv+I3h74QyWQUjCebsJIjf4GBneI+12eX
 QPqqd2D47/maSBSuoh+urXMX9vTTadm3Xl5XWHHmeU+gmM/FgsrO3scBKK/oijtEqIR1
 vY+Q==
X-Gm-Message-State: AFuF++lWYs2gcBJ9vx7SiszkQ/xavqCcQuwTlmIoM568l6fQe8NS+uK8
 4UDtc4nZDXZwEOYAUpKx/8gLuP/OHWdGIPBeyuTNcPZ901C8AE6c2GxwFSPoUQf5K2mM5wmwlow
 8Sfinl07FtJiK3G9xVBYEUP0xZ204mS4drhROCseccg7I8+mfmsY2Y2t/oAEBCeDmQA==
X-Gm-Gg: AYBFou2mRB+AYmfR0bEz5kEftJot8zhKKID96VqabDaGtVN69xxnZEVSZCWYY2liVoh
 PYKBmT7gULNcvvR95Qrsro5bWsuFpVkvGl0sMN2JLAVFOgiXRLkihPI0G05xzjcBsSi4KRJLy+V
 1Ds59bV+iCh26U5lYZRj1NJiS/Hgxel/wrwEc5fd5HDEyTYPQbs4HfyiNA/QP0u8S8ZIBtHVyJO
 FPgv3dST79yfjSUu5LqtWl98+XaNXTGAZPPtza7CyOEq5SY2777kDKApLSOCOI8Xw+B/ru4Y+AW
 SxRY3jYfEYiJwC9gmIN6z6KzpOjCiEqO/NyT8HxwQ/uZD9mD0aivFLFE5A13lzL0ajmu/sJnnTA
 73ObjMQDtxi/zLEIyLS0=
X-Received: by 2002:a05:6102:631a:20b0:7a1:f2b5:6462 with SMTP id
 ada2fe7eead31-7a1f2b5658emr946619137.31.1789998734458; 
 Mon, 21 Sep 2026 06:52:14 -0700 (PDT)
X-Received: by 2002:a05:6102:631a:20b0:7a1:f2b5:6462 with SMTP id
 ada2fe7eead31-7a1f2b5658emr946557137.31.1789998733901; 
 Mon, 21 Sep 2026 06:52:13 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc5755c40sm301730315e9.3.2026.09.21.06.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:52:12 -0700 (PDT)
Message-ID: <fa6da813-8609-4d23-8fa2-f12fc8c1dde9@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] target/riscv: Stub out kvm functions
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng>
 <20260918-hw-riscv-cpu-int-v5-5-f98c5a244636@rev.ng>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918-hw-riscv-cpu-int-v5-5-f98c5a244636@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX8zATJYlRMITu
 tf0EfS5Y701bzDsFyODyPfGT0QWQ0f5M9KpCf371XgguPis+orZCvPTFe2Vyb6jHShPLOaXuJ+/
 BvAriI2i29ACkiV1SgfKPhHScGA9Pjw=
X-Proofpoint-GUID: M8gW71vRob_3f82dAwPLR_MwSfXLXLOB
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1368f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX08oz+P6WYw4r
 zx1XTPWQRVVjdRk7UkSf1+deqUgQcPMulk1QaQbvFJ0ZWFMW7M1iTRxpFcDCAx3qQaemHI/WxHF
 6ZVEgJqWc5FPse7qQdHh0TPrRbwSDQEimB/QFr4k6mT6t6MAb2sSBn3Hiz+NDgEcQzDrZUalePk
 AA9GYXcx1fG1Ju8uRfovwMjVL6Zvn1Fyl+0nOC+hbfZkauQuiK1a8670X/Hpn/IcuiqQ5Tw1wJ/
 +ig9Bybxhg/cckHtQ0WLiH08CRRHpUxxnru9nrvcFgD36MEUQGPDv4wuoeK/yf/cALRnH0SuFcR
 etdHYFuqoPD0Dq/NirXtAi+Acyxu9QGXt152ao0aqSp9hsICjWVkfFBbhRUvwIu8A80gVNDjqyV
 ydyAJi2SpXfK6zK/XmZ72hsSfr8MPY5R9VnGRjhzkTJFV8reDBTXxdUa6eKN1RqCJ7iCudux+gx
 RmJTAQGzzDY8Az29rcA==
X-Proofpoint-ORIG-GUID: M8gW71vRob_3f82dAwPLR_MwSfXLXLOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210201
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2026-09-18 0:04, Anton Johansson wrote:
> Functions used externally by hw/riscv are stubbed out for non-kvm
> configurations, allowing a single compilation of hw/riscv.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/kvm/kvm-stub.c  | 23 +++++++++++++++++++++++
>   target/riscv/kvm/meson.build |  1 +
>   target/riscv/meson.build     |  3 +++
>   3 files changed, 27 insertions(+)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


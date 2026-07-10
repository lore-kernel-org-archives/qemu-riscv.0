Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F79C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJa0-00060R-IY; Fri, 10 Jul 2026 18:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZy-0005xB-Tb
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:20:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZw-0005YC-2n
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:20:18 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AKDcDP1811720
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=; b=k1QACYPFzr+/g3yp
 364g+VWo4CD5QHnEvkm/hBcrupAaJSbtebtXFW3dwxB0Qw1wiAjhLkF+y7VRhVTH
 wUt9Ily6TY+ptHjFdr1VaX5XD3AqElElLiLsmM7NaR/gAW41p2XJ61YBz0GnNtwf
 umyBNsh2jBHVMYYKaWbwVQrGdT8aYSF+pVFZKnIuC4SuXzlv5TyMh70dpaHySVFU
 nK+2aATS9d2EXDvPmql3dZmDxcL64TSdjZVlFi/1GxLzlfgRIJr9RCNYr0KGaHCO
 7ms/8J01GqiAPcY4VvmFKRMOfhtxQNp5TBODx+Th5ZnVVHjqVj+UlBZmgD8zC6Fj
 gt3hCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5fams7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:20:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so15746451cf.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 15:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783722014; x=1784326814; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=;
 b=eFAsXsZrmYJd+9lwLCg4x4vR7b/M6R8pwdlQyCmDfuv9Ux6/x/c1JkRC7PH5YJScG6
 x32T8+O487vhQxChMqpozd3Ojj95k2UzjmHa1qaZie/thpOMWOuYFoKXTE6O1WXW5gAi
 PAmjUi72Dr/pHpyiBqlRkZs7WDGWsS+Tc1Y5Me2Rm13Jv1EBTAsRcGQnsjCT05MY5qq/
 3ITFev55StY6p3Ibg281VIVMfipGUu9ldRUFhzduKdsPmkRViqew27/zSi13LP6egLrs
 7ViNBVmwYxSpWFU8LtashrNc8mmToMV85sK9P2kfhw+E5ifcEjabE2NWcZUYxSK2D8Yf
 P2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783722014; x=1784326814;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=;
 b=rQ3kHa2TJjclq6weESZNDcjcmDMSzZfhffitCEaIMafT5kpQAvKgzEQcgBorSuH8sW
 hNNozCwZZUqCo/FfPUDy8KeXB+350xI0y45EVx5eXySLkOqb7rk0IM81isiZSiLyHoe+
 nKtd38ulhzSv1FrrTcOCcf4Em52bkc7939HL8+WqfdAbexn+KFY6StTg75BHPTUDi7E3
 iXlY6Wb9/TYmJyMtAq4imEfLOmY0o4tGva1VNTHfhKI8nxG1w789zRvgF8ytNkyPD0/u
 Pesu0bpGJpdzKnVDnznPysA/96SdweEHZoFjfyNs7xyt1RA/pB3GkSTAmapHTHvtxe5W
 zR8g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQE2pKdFDVZPAHAo+LvrH+Z1maqyfqXbaGKlOnwD291lUkYFgW3tL+lLbxe3iT4clikhNSZHMmaWKx@nongnu.org
X-Gm-Message-State: AOJu0YwY+YwvepYOJQDmNWNUCWnY4vfF+rVx1tLbMsvkmFMApjkFQcWB
 vg31shpvmEG4meUua5FIa0RlYjFsWCBA4I8n1VyYxvmuI+Vidil3EL9y42u9FAOdQPxNq2ssups
 8eDr239pnF1xz8Gnf36TSEI1VHCaVp2I0ttc1ytrA2P3+hax0WyBK+mf9RQ==
X-Gm-Gg: AfdE7ckdig0k5Q72rPc/MY6YYbGHOxkrqwo+SL80ASCxzGkU20IhqQdfxDZaajlV3uz
 w9EmRlPRkWEeT6+Uouw6aNgm4+MJPtDLrTx0tluw8OdhEPGuP5dkea+WY7R6MGcHRRNU8dFO8mt
 78mwBSDw/DCz76WSYCi+ObBCCN4apV3+Hy5YICidbK/rc2jeb2N7/IH29lxxPETn9p7qktr2Ij/
 7gDo0JUJJeP8ejsjd4ic8zx3S5QQLDvBhTLdl4E2+OCQtXAzeCoZN0U7/xguHOMHPDGduXHhT9Y
 KYnkOOlJDHTrn4758NATM+l/6z2ALEFy3XKAHdRe8PSFdQuii099MljnoHllM1FB5ae7a7eivPr
 +OqSRnPyi8f3GwcRZgdSHagXIrxrwNWEZPQzeEmXmZu7dweZWaO77z25Jm6k7CQ==
X-Received: by 2002:a05:622a:1b17:b0:51c:c37:df31 with SMTP id
 d75a77b69052e-51cbf16dc65mr8091301cf.7.1783722014484; 
 Fri, 10 Jul 2026 15:20:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1b17:b0:51c:c37:df31 with SMTP id
 d75a77b69052e-51cbf16dc65mr8091061cf.7.1783722014078; 
 Fri, 10 Jul 2026 15:20:14 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm61420318f8f.6.2026.07.10.15.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:20:13 -0700 (PDT)
Message-ID: <84421cdb-00c1-4999-9c60-79d61a75641b@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 50/51] system: Use tlb_flush_range_by_mmuidx in
 cpu_watchpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a51701f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AzuLvYCvoCWwYG_7cD78CFqLhFjN1uBg
X-Proofpoint-GUID: AzuLvYCvoCWwYG_7cD78CFqLhFjN1uBg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfXyq7cgrZfB/M2
 d1Zw9vPvMHROBgjBW5fVwtfcjCEQYhJfTD1K9nXVMW2q9ZYf+KEzVyziCNAj4qXp1njoZ4+W/8l
 lIpMg0/4+5WWnFTWIhtdcgq47iDG0rA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX/H6EVnU94UtG
 HMfLbHVkSrO5o12ahG69qyYqhtouR/y1FckmOjNq9hcguG8I/L42cm0Thohev4XhRkZ9++y1slL
 tCQ7lXiVg8bqINyK1FYIjkO0RwdEyyuazAORRqGxk/23HDYWI8Dq9OMhuq/lVy++fQDGVJ4eE3l
 497oEXBnuSUe7ZhLS498efjfUdMPOvgXUC2pzj17xCp6Us/pcAkNi2i75NniPjuUWijvntw7w2k
 g2syYZ4uaQjTF585HONLvsSeau/qZHTXTt5mhPIkdcq77lEWPUevT3G19KSBxz0P9YsmQXRZ3u5
 dj0yAp8eO3jI73FM0Fql6iS2byjW8BYmWEjhIcyM0DWbtQ4XneJkcA5X/hVgqRf76SfWKa+iFwa
 mmCpi6JzZjv8kac9gcA2mknSeboC62UmRoi7kp20kIbfXFLc08mQrCS30OT3UpWsTsOon5CTzcZ
 p4BsSwvMTVr/XR4Pe1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100224
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 10/7/26 22:54, Richard Henderson wrote:
> Update to newer tlb_flush api and flush exactly what is required,
> not single-page vs everything.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   system/watchpoint.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


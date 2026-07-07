Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA100C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 06:36:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgzPY-0003VT-Dn; Tue, 07 Jul 2026 02:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgzPQ-0003Uy-UP
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 02:35:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgzP2-0000c0-KS
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 02:35:35 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66748nMg2649166
 for <qemu-riscv@nongnu.org>; Tue, 7 Jul 2026 06:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZcbJJRdMgGnFWH1wgM2q7disRrta0npayPNRaFY0AAU=; b=g1RlUMJNshPqfeWR
 xVIGsQ2um5fzk7D97xUDf45tL21h1Sbziy1JXSU6jpxQfXWFKb+CrQn6AD11HL3L
 H6EuLsPtFPawUsQf41q18z1H4Z1lUqAKlROkhEqkFYwp9twkI/+gEXjZ1yWnhQIi
 Xga/8TmxykIJjetDL0GlHv45RCZhVVF3v4n5gBTV7NMCoczZ7D0eykGamLcdaMd7
 zEhFxMxHDldXC4OAIavjUYKV+7plYwozpeWjubuAZQh+xXuGLC/r4dVKjPRCNgZC
 4kxTrLTM9aBbJhsl9o6EHq6amHBrf3SAaRv450GhtJNZSVSMlxhz98o+uY5KsBB0
 DckFvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw2vy6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 06:35:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1852a86fso43183791cf.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2026 23:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783406128; x=1784010928; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZcbJJRdMgGnFWH1wgM2q7disRrta0npayPNRaFY0AAU=;
 b=Z2571ug649XTEX2SBU10TdWBdQiXPyzSI+vmGibZugFq6XOMDHoB1tKt1oQI7SXSU9
 OQjZuPoZrdn8rJJSrGvUvqFmnT0nhOP/NPFBjJBN5AitPsJK0WW5ssnSLbzbM9BHfhiR
 ZvNc08yaOQ8mwIY2xH0V8apt3lQkGyCJn13SrFc6arhPuegGNKW54mEyeVVWcwjhs8Nz
 r6gI9sRM0eNgreD5HfDVKmmyOHpjwA6sQMwOXbUYcMZQNPkzS2+hwxo6LikZaorormIf
 dc4xBdU4cEvxblDw+PSLzCWCzedPLzO4iCwZQJlm+yDLEOr4fCeZ4lEm7XymWa0oImUQ
 7jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783406128; x=1784010928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcbJJRdMgGnFWH1wgM2q7disRrta0npayPNRaFY0AAU=;
 b=X0f1FxG/Rke7hVAzL9FF+2gb7XcWPNdkNaqyVYZ2rwi2tZ+jOgQL/UaUFRpsywVpih
 5QtnmG/30vhYd8bz17gY6NmFarssBCPAzO5KDbic0ZjmDtjI7v2I1ySCo2ea1CVMJznU
 +e6MPaG8CeLrd7GarO78zFXXZo5sKqGPbQ1Qa8THZWYh0y1ZmjQgwKQtH3OXuIoDD2Xq
 YVybq6tkeW0Qdv6eg5dEEuQ3mMxkN/SO/1X9mpjawXtAVvwYp1zlNicVADDlTvkUxOD2
 +/GiHSGkI3nF5JPDaUazHD7bzerJhmZ+PPlEAF5L5c5Rz8qXNFh4hsGOuv1yzBwJlhsO
 IrFA==
X-Gm-Message-State: AOJu0Yw9Y8a5lwN6BcMInSJB5IS0Mx50NSEuYeCNg/nHBtu56GzGyU7t
 wP3OrV1c0Y1FXSNE674c/4f/vewInEceetWh2nsSxFiVsTEsGQgxMyJZmHiBVElWqXe0LAEOUip
 JRIMewcRaVqadM3rxRocGnojR7tJJjeN0+9Tac3Bz0xJsruNxADWUrAUF/A==
X-Gm-Gg: AfdE7ckunB4DsnibDSMfsEHjrkYgVo1ZCH4S4XBAGHAkF7XCkU/yunrGXC2+DGl8VQT
 wfjj2N7bkB45bgx6pa57PUk5/fphkZpOpn4IR4+Wl01Wz+vi2G/tAyPfREHVaO7HVHQXNqYC9yM
 CvhQqU4EVA4WNi7Go7xo+WlZoJ+sjnx5eQ7OoJ/bDEdiQjXesGCtuJ0Y35WmUZ+vaLycp3AYN9u
 ct6MUPui0lvO9y/oEjtBpYvO57SAI6FSYgXU26yns5oINbrMtubZRG2eOs5AVXzge/aSRDQxwR1
 u7oBF8jNjegMXnbZdl3JcGTwYa4rKUqKnlRPNQzh8aPqTZdF35dOfRJLr7+bVcOz/5/ccqO0u/l
 Okhe3wmW35hqF+AKq7JlDo+xOw/QCwZD+/Ocg5TfP6Vml24GUikVuIir8chfKlw==
X-Received: by 2002:a05:622a:2c6:b0:517:8470:2d2d with SMTP id
 d75a77b69052e-51c747a57fbmr42162321cf.29.1783406128124; 
 Mon, 06 Jul 2026 23:35:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:517:8470:2d2d with SMTP id
 d75a77b69052e-51c747a57fbmr42162161cf.29.1783406127719; 
 Mon, 06 Jul 2026 23:35:27 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0ebf593sm32696705e9.0.2026.07.06.23.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:35:27 -0700 (PDT)
Message-ID: <ad3fe9c2-6205-451d-9dc4-4961a04ed34a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 08:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set ftype and iova in
 riscv_iommu_ctx()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfXwBAc1ypHHR8c
 0OkyM7jJUEhugjS1VInKrZH8Kl2a4OKDE2TRCjB2vFzLE0Yt4sRdh8v1k4EFYVwhOxvehXW5YT5
 w1U40ElBs7TF4ll9HvoaDy4TUXUgyso=
X-Proofpoint-ORIG-GUID: os6hiydKnXV_c0bmqxPcoIk25XywzC-K
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4c9e31 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=iPnIPfa5SvG1HxkiUdUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX7I86ujU2/EC3
 M88PzeGvcwx+l5g8uQLUsB4IZeazXUxuIT/wUDBgwnd4K1hS17nyMLBEsZS/B2EhpMn478UbSRE
 NdmEkVawvII+ZlRPFdL4pfj06Vm3uhcceuX75yhcT1S5U5iNWL+Y9FRG5ulBgCABBOCLkXLgHv+
 YY/rZIbv7fe9FZmz/3pmhjVtr0oGtw0dlH9fAMoRh0o58+1BkcndBybM0e+OtuLDCu7Il9KYj6Y
 G00RtvNJITuzCWINUxowQU+J4qKK7X1rC55YD5sPInD8i+XBIVdODRd/sPy9n5kyXtctht6OGph
 OECIfWGDVyRm7LsxI59bzqleFQtTiLbxeBbhyo01j7uFr9PVXUTEzpw4Wziyynjb6e2mjySVosy
 UuDAICUqL0wp583oILVC+MPaEU71KXz8DTi3he2lFjXRodag4IcGnpjEjdfpiXWMOa08+y6bzwA
 RjavSqUCWpCxhV1O0sQ==
X-Proofpoint-GUID: os6hiydKnXV_c0bmqxPcoIk25XywzC-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070061
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 1/7/26 11:22, Daniel Henrique Barboza wrote:
> We're hardcoding faulting type as READ, where it could very well be a
> write access, and we're not recording the faulting addr/iova.
> 
> A note was added in the fault_type logic because I wasn't able to
> trivially handle a probable code repeitition it in this same patch.
> Something to do in a later date.
> 
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3564
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/riscv-iommu.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)


> @@ -1339,6 +1340,7 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
>           .process_id = process_id,
>       };
>       unsigned mode = get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
> +    uint32_t fault_type;

s/uint32_t/enum riscv_iommu_fq_ttypes/ (can be cleaned later).


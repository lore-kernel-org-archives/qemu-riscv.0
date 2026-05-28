Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD3CD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgGg-00046h-5F; Thu, 28 May 2026 15:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgGV-00041y-If
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:19:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgGU-0007E6-4q
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:19:35 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SGtCoC3203335
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VUju7NYAGpeW+l4So1GiQZ2P/gBnIVrT0IrmHpAfntQ=; b=ZMpHVLUBL82pmjwB
 /KOq25YXbQPacrQqMKM6gQYuoszGhSE/JN50UUOZbo5XjiWZ5+JfCKqzxxdocHJy
 WFy5nxp/xinyRi1wkehKCEzEbIu5hkn0rBdswO0Vp+W4bnpj9U5/fxqICYM9N5KG
 p5aLn9lhoTAeOBpQGTKQRp37fEeWVw3CmEIGpEqk0YcvX7D6Mhcs8879SlV6LQJg
 9G3Mckql5wz6QClfYJqZEdC96QTj/qq/qEiORsBOX2MOz0Zpk+bLsU3GzQxVEdIk
 znQaaEdCLlfNVAv2at1juJGPPpQgeRLSJPc0llowZ4KHmpEhKNXLRuK4FhgNbGxk
 aYmrKQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynmf88-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:19:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-13509e2e47bso16796761c88.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779995971; x=1780600771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VUju7NYAGpeW+l4So1GiQZ2P/gBnIVrT0IrmHpAfntQ=;
 b=Q9NbKS62uvlKsUSd8KR9k/K/YztyRQqgauTsUB0bzBLSO3LEUdC7a9AI2nY1kB2KYI
 xye+z7Q+8n0ojsEbv2wQcMW/V1Wl7mzkJrd+0LAduKN6JQN3WB+3iC1VGzSSnic7+z0P
 OQRakypAXz+2G6Z0yzPYT0LrQTmxJNPmZKvEE0GIUZ9O1P3UoDDOX/gYrjHGOXBe4+Fx
 EMpbVDm0Q3aHFMoIPR49fGQ9UW7i1IyjUDAI7YlJ1idIhxrc6Tmsy/+o9yXuY55fFkhc
 KwM5261W2h/EtOXVZe6wRYl0Rdkpz/6pGoYMzRVlP03K0ouWiXizaPpk+RYhTjmLEnnq
 k/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779995971; x=1780600771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VUju7NYAGpeW+l4So1GiQZ2P/gBnIVrT0IrmHpAfntQ=;
 b=mHFOoZNWQgbxOPrcpBpvu0fJKIHp5AdzYOsaDjk2chO/kATwem4LBNO3vV75BC8YdK
 LroaZQkifMcOafDytfmxIs2+QyDfNFUBdOmSwb/eepTtdQeZGZw402gPEXMbcFD1NvxJ
 ATGRlrofAxVfQYtVLxCpe24hKIamlkzSaLU+Kvt9fBKGaPzMOK70KOAHD0wLhSpnSriq
 OL7SfdmizGPKpasFMrZqoU5PwKNqlOe15jAREcQOpIxDWt24ZkhMMlwqdkunaVAPTgep
 NMM+aGRrcm1Wm2ZFFPo38eX7FrgNJfqIjKA07eAp+Xld73Kn6RputA3oAVzGDytgU87M
 MBjg==
X-Gm-Message-State: AOJu0YzmXWjJPRzBnSZWWdFol2C8WIZR+iq1DzqHwPJeBNJVCpRx+Q7Q
 ZgxNuAJuWJ46+zpYK1xXexYyASTTxfDkCBVNVqNYl8lnkYLV+VctiSyuZJDHAEFBAa5l4dWfAty
 vnQpLG38re8bvi+gyAHzAklg/G62zZL9R3LgtNvAVwR3wjiFlIrbtnZaYMA==
X-Gm-Gg: Acq92OEbst4eCR9LOwrKioTU2cnzyQb6sQChWzk030FkdQ9yn64zM9u70+MjixNrYyY
 qT23jgheipVAzEkyVqkHIpc7PMZejZHgO6heeZjlRwTJtwSppBWhKh+6trR3sbD3hQYBAoBy4TB
 AM/3uyhOHDfD2GnNQaVfNTGXlUdfV61F9R8EN7W1n9Ni+eCuzg596ZvogyW6hE4ubxw9Xr21tLQ
 kYOvrdkM3Oo9ZdwzyQ5BeBVamRkTo37ytpGpQK3Oe3JP55s0yaE9yHMCg5clwSic8NZ9E8FEuXE
 aBDDYWthv+iZU0HsXHF4lW0gDCjZJ3Pc+SLtt8wpz/D2nEnz1zpQMFijsYpj0kozSI2k6V/Xl7a
 hlBCgg8coJZ8gLDGwx1OaXN+edrRCgItgx5ZoFPkFtzq948TJ+CQ2dLR9vW/0U2p2s9JfaEmNnS
 y30HoVjIFeq8FQ9NogFJQqXFMJ
X-Received: by 2002:a05:7022:629e:b0:12d:de3e:86b9 with SMTP id
 a92af1059eb24-137a8e37356mr124801c88.41.1779995970892; 
 Thu, 28 May 2026 12:19:30 -0700 (PDT)
X-Received: by 2002:a05:7022:629e:b0:12d:de3e:86b9 with SMTP id
 a92af1059eb24-137a8e37356mr124779c88.41.1779995970329; 
 Thu, 28 May 2026 12:19:30 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137a948b649sm175236c88.2.2026.05.28.12.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:19:29 -0700 (PDT)
Message-ID: <ee897213-c4c2-4e8f-a849-294859f2d348@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:19:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/12] target/riscv: Assert PTE.N/PBMT bits are not
 expected on RV32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NCBTYWx0ZWRfXxATT924SipJJ
 A4s88caopADPvYCddr2PRDJ/MAYQWpTadTlBI1hn4vMD0/c5l8nROqLD2iiq6MPiNaSNe6lldmV
 9jwwcF1KXLE/IsfPuJj1Da07OmcUo2SSK+ikVJnpe0I+OAdxtJmORFjHV+CfRFwB8Na4lEeDWod
 h/VOfNONZiNRBq+K4JpzsEVmqImKS7N6dpepF4W7eYkzxqk4zbn7Q/zA2LJ5r+pvDP38m59FMOG
 HAGBGQW6B+9enCrwA2fwdWEGsSD6KxVHQr6BaMl7QsetkyieowsDwV75a8He/lCGDwGaOxdiTvD
 jI6JNiuEnamiLnLDaN3a+sHmmVfafDa/7gLyR2CwdtoL9U4aUX3/n1a+9jtnRqKOyoXKTip4PRG
 hQlWeuogm4uHRgmiy42RTsoBEx+rGMANW2ZWwzLLd943L6oBjKRl37x47HeoYSdx1h/hciln1bS
 bj8tiPt2mwGWPrxRqXQ==
X-Proofpoint-ORIG-GUID: JlCDX8mKKHT4-6J5rFPngwy2gxeNK28x
X-Proofpoint-GUID: JlCDX8mKKHT4-6J5rFPngwy2gxeNK28x
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a189543 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0mYzyVw72CmaQtKscwIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280194
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> PTE_N and PTE_PBMT are undefined on RV64, assert we are not
> under RV32.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/cpu_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


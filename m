Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C750CDB471
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 19:20:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wc6ec-0003fV-3Y; Tue, 23 Jun 2026 15:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc6eX-0003fD-3K
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:19:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc6eV-0005Cs-IZ
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:19:20 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NDFriJ271193
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BWvukd/5x41y6eBOHBWju85y163If+PLjOWr+GA6xBA=; b=LnuS6oStvplMMuvw
 H5EO3bdSYtUMPlt4LIQG6VsghtUIgxWiDkLJR7dtTev5ACnQ5VrDGmq7atpp5wlh
 aDyWdy8UqJTewqLgxNGsGIGc5MmPke4pTTdECLYi3xFQUzugqKdgFxpDmMH/Gnk/
 Bv9EnxyGyFwPPRB7iIkUWvWNjfgeAXk7xdMlhGik9WMxi+nyCqp00d9QgsCab3uW
 jlAujT0+7POInb9LkA8LA8LXLJoGAi1uFl7VyFDT8TnWK69/dN4KH19w97fChQ3Q
 A8IVVDaw6bCGrgoj44TYxmtDmEKuQ1ee2lekLrfFxh09Vm/TGNDDflQEK5mSXnaF
 jZ5ACQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh1p2v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:19:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91579011fd1so17915285a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782242356; x=1782847156; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BWvukd/5x41y6eBOHBWju85y163If+PLjOWr+GA6xBA=;
 b=T0AP+NMa694RWeoSX+0XgsIYvHfIDMzCyspLtfOVRtpiA2Pjv2WFu1XCsFaMwRyN6T
 2cYtVu/Lt8vyudHJAYWE2S+jzTYCkZGUfhvMmV+Xdtu5hQDVeRvbtFSwopmcbMPSPdas
 2JJBs7nL1AVwsHnsKVHF92Z/4YKsvhhB0Lc/FurB6gGywUDipjOa2Z6RiDy6llfA/Rjl
 BLUaxWZNx9MQNER0jlYFdHhTxHC6GYtCUOkw7MMneKY+2V4MG5dQUnOpxJuBuiH/c+dH
 hYL9ozTbJtN1s90OjbgqudbZWNUOsH/SvR/dCkjsVPWuVa+40al0P/34inLrXrNRoqJ0
 dUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782242356; x=1782847156;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWvukd/5x41y6eBOHBWju85y163If+PLjOWr+GA6xBA=;
 b=qBMNI3LXdhKT3KumYnOCSupBFUAzsTXo+BXoBRsV3Zi3VnY64GMa4ItdCEIkWvmFJR
 iL2faF+P12EWwoWPK/oW4honBpZu7ETOU+c2A508BWluNgO8kheaYobewUeBBXoctjCo
 ZaEroWEZBfJ+O+UUqCWOdlJuQaYApvTar7KwiNlSA2PLAdMaD2ppKCxhrDaLVkAygIkp
 KAHn4HjTdF2+KYUT9DLxRA5O6ucgmfK4Glm1qlBbsFmhQAclInljhJTXyPuu4hR6pLSq
 PFXyg8nGAEdkPaepfroOxxOMv8Y18dZ5kXlt40eewgcfO0Dy+fz1J21qzhRM7jksiKOc
 UwPw==
X-Gm-Message-State: AOJu0Yxy4MvKSD0x8q2Tlq/4O47er1HzVR7NA8wcM1zNf7SDWUCmARCo
 zrkyTqGbOe1m3Qj6CqL7nIbf6cF5nFmjOqIYRhea8OP8SWIHGXdc2qbEYtpQ7rJWm5ILac0ZqRf
 tJKtmU+bBsyE9o5vbQ12HULDlGJQ2LoXYPzYadoz5nN97xFXoIqt4zDc97A==
X-Gm-Gg: AfdE7cnBGRGC0pMt9/fMWOg/K3hqfmdhhWPs5J4G31dxel+LemzjLEUf3rjOqzaVc1b
 rWX0wwZoAAyQHdXZz3nNIWS6NU6inuKZiHwhVjL381eBUo30FcIeuRQ1XIZXLNtaa98SbT4zwrw
 BWgeghIbVVLEmMcyXv2DJVC+ClcVCCkpkVCRq8TvjczjLCqrdfeZwh44Ux0PzcSO3OM7RFYzfI6
 5VP8LRuaRLvBTe9gVBKCGN77BP4YErKpAEVZRPi4WD+1cTHNrZ3qYnLFiYQcsH0Z3lCYQJTk6aL
 +zP3fyfG4pAt/jD4YgYXEFNshNXMEUaKRmqZIi9b3AHKDwVzPKr9vzwbqjHfTaP1QhuRdAKCepk
 LHpGp2FsIkHR6hjE/blho4v5UlUGlJ4/QwJcOurE5qaRy
X-Received: by 2002:a05:620a:1712:b0:8ee:bae8:2bb8 with SMTP id
 af79cd13be357-92783570710mr63348085a.36.1782242355834; 
 Tue, 23 Jun 2026 12:19:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:8ee:bae8:2bb8 with SMTP id
 af79cd13be357-92783570710mr63342885a.36.1782242355389; 
 Tue, 23 Jun 2026 12:19:15 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926000c1c39sm337032985a.26.2026.06.23.12.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 12:19:14 -0700 (PDT)
Message-ID: <f5acff3d-d756-461f-8e01-5162ef94936b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:19:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] target/riscv: move custom_csrs logic to tcg-cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-11-daniel.barboza@oss.qualcomm.com>
 <755aa324-6792-41bf-be40-ae2155fefa27@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <755aa324-6792-41bf-be40-ae2155fefa27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE1OSBTYWx0ZWRfX1/bP7ALrvXX0
 662SxzWi6FQUSaLMG/DzNAJhOM3S00uNoIhcZBiLWSITN0v84mKxFLqxLp1HW+5hDp+UZRgdWSj
 vzdOpmgOAWQk/z4oLxXQboQD0d+YeabR0H8BcqYHYePV0p6Oy4eLpS5s+4AWE/bbLKwOBxraHMP
 lcP7D+NitRvtCZAJ87lQpOYQFOxfMuYAj1gu4LvmxKu/4S02OxBVnRxtqCNu/meZDQ56Ij+SD1X
 3JOwC83GRZQhUBBVSnm7SrCbY3Tcy4anXzjeg5c9wCD51GsjnIdbArPhbnoNErZIm/7Ncnpzaxy
 1rPQWFb8xDT8N4MKmUek6bfn1QjMsuY1UqT+W8Nc1CajZH8EQOWHAnkB2X86UXHPiTHVK1HwUOg
 ffk25elG3XJL+/F1sCrmmSuvqpLXcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE1OSBTYWx0ZWRfX7H1Aj00Zqc2Y
 82iHozhb7xjY+RRhfH7DcBGOXXowLld7Mf/vgqeZ8Sp7O3sbs0LhHvAvfgujHbLkTefFUsKHuAb
 bP3nJt9p/p/N300hVcDwDMZMRdDk7BM=
X-Proofpoint-GUID: N3KsxodZ43C7ElJIktm40QpSO9im9ErE
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3adc34 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xYj2K_4AjhV3JU0JadUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: N3KsxodZ43C7ElJIktm40QpSO9im9ErE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230159
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 6/22/2026 6:02 PM, Philippe Mathieu-Daudé wrote:
> On 22/6/26 21:31, Daniel Henrique Barboza wrote:
>> We have a couple of CPUs that has a set of custom CSRs that uses TCG
>> specific APIs.  Move the related code to tcg-cpu.c and do not set
>> .custom_csrs if we're not in a TCG build.
>>
>> What we'll end up doing, sooner or later, is punting all these CPUs to
>> tcg-cpu.c since they're all TCG specific and KVM has nothing to do with
>> them.  Another time.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/cpu.c         | 24 +++---------------------
>>   target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
>>   2 files changed, 24 insertions(+), 21 deletions(-)
> 
> Squashing:
> 
> -- >8 --
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7582874c351..4e58a5daaba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -570,7 +570,9 @@ typedef struct RISCVCPUDef {
>       int32_t vext_spec;
>       RISCVCPUConfig cfg;
>       bool bare;
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>       const RISCVCSR *custom_csrs;
> +#endif
>   } RISCVCPUDef;
> 
> ---

Squashed

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 

Ty sir!




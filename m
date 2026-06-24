Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC82CDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 11:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcLdg-0001RM-Ig; Wed, 24 Jun 2026 07:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcLde-0001Qa-PV
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 07:19:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcLdd-0002I8-4F
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 07:19:26 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OANmb94180623
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 11:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OVWgMC6Q+RpoXrJzM0oD8D4c/89GWCELuadcBgtwNEU=; b=eUsaNFDnFGLdpQV5
 oVSHfDwJEbqlb0dYRAru8pzZu8KqbTlmO1YVEYLWNJmtAE0rfmAWaTYX2ysd0jYv
 gw8OjVsOZBXLP8YAn8Be2CLKd2zF8SvXycnQWOl9XcPpmWsQR/EOwh3Hbm4joJVY
 UN8WGf9Boj16YX57e15gxOlUkdXZQOF4hCvzu2G5MqmG3pwy7YjJR1StmTCxvA13
 9b/aShl+7mChpexGh4KrFT7vmlMKxz22PnHTRS5d76dl8OZ0pwq4unHtZL1AelNt
 O/jSpkfJNx1YlExPDDKvlzLdKvbP09n9myjI8SLWfoptdF8NjB7gCvhFrsQHapiI
 nEoJGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp8x90-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 11:19:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c011c7cb9so2328198eec.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782299962; x=1782904762; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OVWgMC6Q+RpoXrJzM0oD8D4c/89GWCELuadcBgtwNEU=;
 b=ZLsiE1vxTWuzRJbfBoDdNdUhjq3yBJXxfeQ1CNUNnwGSWSaKI0nxQhDFhRoF0N2Thx
 fgsfzBv+Lk5QUvKiNvzCZskqQyf0qTP09KIuVImfxDeSWiHlCFSudlYRMJzLqL8SLvTM
 AOH4LBFIcW4d+sX0/6RnfuxkkV3mQ0CjCCgLPI048kcDAo6l6GyoJ7R/TshzH7khbOo/
 vs3Kp1TNU0NmJJfPljsihKCHyZZ4G+IBH5/uhlrM1j1eSGElZZQbIJuZXldabjLKKdKb
 3ln9aeV08EMXWMlvWQatZKL7khmvW1ZSklhm5uhRFLLmqNDZEPXnnBW3X21XmhhYaL+5
 /HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782299962; x=1782904762;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVWgMC6Q+RpoXrJzM0oD8D4c/89GWCELuadcBgtwNEU=;
 b=ElH9+2e0TPmy8oC6tQMhTr51m1SKAIuPlOPbhxLCQv+M0NlkBCl2zEtr1DJy08R/4n
 oDzWUhbS3KyeuMy5MMT22Z4hHMeSApKCovVJy0ICCsvgEyp9KFhG8FbKl5loBR7Jpw9T
 MeCArqIFMq3pRmOy+jRB44hcUVj3Pkt7Kig762wyaQWbeP4YFsIsCeIxUpN5afTi2f5c
 EYdp2um661X1hfMEn05z8jdwiM3VabsmzLTe+4gBYsFUWfdNWwq+YjmSn4y5QK5+iHa3
 EGygqXJie9e/D5XjPvW1TwlOp3hr5Zezu6lDakwWnd7eLeryNHxL/Dl2lzc8XZwm4bDu
 0CJg==
X-Gm-Message-State: AOJu0YwLhufHFr5S0BSnFbwRMR02d0i+Y30f60mPGVU9zmf+tc24Qvu7
 bc8t29b5GJsqj1h/P/T10/Fw3NuCOuko5c7mbKK4SGEcDbasTvBuxiTBPdel4EVjye1W9FNqHUQ
 M3piJlcCMo7jQkhm7PqeP6AFkON8SynGrKQVbeMdIBjfzyrc5VlM0q+npkw==
X-Gm-Gg: AfdE7cmb3B7MoRLvO1LpX6vFFCUlyH+b6lL09QAImkve5cdCql6ANCzLh1I04kWbzDM
 xTTxwVjzBkYaoHIj5LN2fFGlu9HjGjazcg+FwRGwbUVWyBW5Kp5bdAkWNnV/fmSjIblEvS/6czr
 5juoU7F49mx0JDCLguBtth/RArlfQorETtU/mDYOpfRLgMPHDSCdWy3DpUDlOauYNbm/I3PxTkF
 caQYy+6GO72n9OCzEZxKG3GyCnx2SylZHOft8WRZAsh5qKz6CITwW6pbU5tOYECvaK4+p99kgNi
 1SaQ5nSMPXSEVtH4hiIsfF93S3Gk9AU4PXz8/12ie7RYZZbsaVbGk1xCV6zo9DT7rbwWE4elH09
 XE3TIYgupByoMtjuOloGl8wx3aFAQ9C2t0y98jfnAC18U
X-Received: by 2002:a05:7300:2307:b0:30c:38ed:46b0 with SMTP id
 5a478bee46e88-30c692f5606mr2773090eec.16.1782299961777; 
 Wed, 24 Jun 2026 04:19:21 -0700 (PDT)
X-Received: by 2002:a05:7300:2307:b0:30c:38ed:46b0 with SMTP id
 5a478bee46e88-30c692f5606mr2773048eec.16.1782299961099; 
 Wed, 24 Jun 2026 04:19:21 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1be4b24esm22364515eec.27.2026.06.24.04.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:19:20 -0700 (PDT)
Message-ID: <fbf36827-e12e-4d10-8cf3-8284ae903ccb@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 08:19:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-18-daniel.barboza@oss.qualcomm.com>
 <dfcdd6dd-ed02-4225-8238-f9a78636057d@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dfcdd6dd-ed02-4225-8238-f9a78636057d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S1ZY8B7Y0syW2WaVepE-QxcBcgZlSR1Z
X-Proofpoint-GUID: S1ZY8B7Y0syW2WaVepE-QxcBcgZlSR1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NCBTYWx0ZWRfX24kob7TypcTJ
 n2Jh55KsWgHzYJtk7x0aNjZ27/wEa+4qhkTWDsSRkq+Ql4ujucB/p1JYNfH2ePMiPbV+wwo9jaB
 QnPymle7Zm6LGy9jZtQEVutiIRbJOAFSe/EXYqSHTJ+fl2SpvAmhiJ3CJxoMRg6La3pjr8ogXUb
 sAFBXzg1eo97UnSIH8IPuWpGD6WLthbJdRXhGTqAG3UqeMWqcaVdSYzK02RCrdiIuLajSiyuIYS
 lrsDxICTcRLCSqU7871V/4MaJqQ54q2iBghypT0DWuQvEi989YtckKB1a1NQ1CJO0z+4Asnboto
 7l8GokbfBfj72CG0R43mQKBhdFb0Gv9Enmyhv1tx3jQRGFtqgmwwCO7Yy1vrnTSwuxw5LRw6CKe
 wsH1pi0NhvRG2Hm2IfVoSb3/Rbu/5baZr/0Cv1IiwgCtFMkl04vT3ylTOeRQo8WiZU6SshzlymR
 q40H/EH1IxPIlEXQs7A==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bbd3a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=f1OD5SgU-hklIsKGyq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NCBTYWx0ZWRfX93edIRIV1Jvu
 pYvpeXUmG8bHzB38uRPnM2IemyZqRkxZzmQFqSn13eKh6ksyvT+Pj1E0ms3ojTpMCN8H7aHlIV2
 FUPkMu5vFBzlMjxm9U9PgJn5jUnfW/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240094
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



On 6/22/2026 6:13 PM, Philippe Mathieu-Daudé wrote:
> On 22/6/26 21:31, Daniel Henrique Barboza wrote:
>> We have a lot of TCG only initialization in the common cpu_reset_hold
>> callback that prevents --disable-tcg to work.
>>
>> Put a CONFIG_TCG ifdef around those bits to make the build work.
>> Eventually we'll create a TCG specific reset function in tcg-cpu.c but
>> for now this suffices.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/cpu.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> 
>> @@ -1013,6 +1009,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>                       MENVCFG_ADUE : 0);
>>       env->henvcfg = 0;
>> +#ifdef CONFIG_TCG
>> +    uint8_t iprio;
>> +    int i, irq, rdzero;
>> +
>>       /* Initialized default priorities of local interrupts. */
>>       for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
>>           iprio = riscv_cpu_default_priority(i);
>> @@ -1050,11 +1050,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>       }
>>       pmp_unlock_entries(env);
>> +#endif /* ifdef CONFIG_TCG */
>>   #else
>>       env->priv = PRV_U;
>>       env->senvcfg = 0;
>>       env->menvcfg = 0;
>> -#endif
>> +#endif /* ifndef CONFIG_USER_ONLY */
> 
>    /* !CONFIG_USER_ONLY */
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Phil I forgot about this ack. My bad :(


I'll make sure to add update it in v3.  Cheers,

Daniel

> 



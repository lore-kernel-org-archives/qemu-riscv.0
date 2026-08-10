Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68227C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:36:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtFrf-0005e8-Nd; Sun, 09 Aug 2026 22:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFre-0005dJ-Hs
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:35:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFrc-0002Hx-M2
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:35:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L7EwU3792359
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w7c/Nu+f1sCVYmmy6FNNTIB/u/MgpM1CQ5Ksp/JBGa8=; b=TKZVnKlS8amfRjhJ
 DnHZ5FQOGY8fuDCAcO+E/acM5Xt2VgghnomRMPI96LNPFIk2Q7KLRoWznBmpb37g
 o66kzLB/PLUcrIztqNmxkOm+nCeQMllFRjTjVgB4y3Sko2GA8KuOxgS5+BFdR2f1
 81PBhWy3IhHK1GCKFQ4jWYnwrJbIitQWPKatSh17ZxSajBL0uZS9Qsc96meFTRmo
 aXNmM1Yl0HYDDRG3+/ho0GVZ8cC4Puly4QylQNMCskn6N8rRYY7FsP033vtalmfc
 rv832QTBQ9LSVUQ5MPDvkizRTlhlqoOfhQ/8+jq281hEhWHDWKdLBtHc3TxePamp
 UE/IqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp4bb1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:35:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0e702df8so20815351cf.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786329341; x=1786934141; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7c/Nu+f1sCVYmmy6FNNTIB/u/MgpM1CQ5Ksp/JBGa8=;
 b=KgVWPzZWKdWzdNF4plqAc0R9NtPO6lQJxnhORqTrE3NU2l3Tw2cxyn3mP9yNZJOnF0
 ijtelb+7kxd3mSEhBHayotvN3p8wH1D/E16BXQF9ZNXPHIaTV3X74a2Bct3iT9FwpK3u
 XYnsDmso911inwEpJSp3+iV6+Rmfc86gZLheyK9TLybxZWk/PasiUo+/OFzH4DO08/Mg
 bofYtzDqNGd0PPhyaPqEHCfJUpd+d7P3ZlgOPeqWTKlNqizkYkVg09L/dfXOIwTqFw2Q
 ybMs0Bhay3hSSG9hFr2Eq8VIepsdDBACInUp76H7Z9Jt3SJNdGZVpDmbRubDqkwCc5EX
 f4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786329341; x=1786934141;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7c/Nu+f1sCVYmmy6FNNTIB/u/MgpM1CQ5Ksp/JBGa8=;
 b=itekAHk4BkzGHaQsB0QMKBHrxC4sBsS+acvVDJB1TzMo+ONjB9MzNEE8J2eGFga3u7
 7cERcJzyNdazd74M6v1gjGUik+kFpDh0Kjn/bD/zCUeEQLCerQePhSt57UXHWCF3zpno
 zRZQdixzKmhlB9nJX6dsEy5In3cWZQM8oevPoDp+IuHerpcJGNg8XXZ3W84J8HqXTq4j
 0V35DdwMSa6U86c7JyaCqxR5FhQKmdqKqm9edV8+x8SqT4w3Ideag2Wcz+UeuJRxavXB
 2evorFiWHVeLxYQaH8rVs03s4wt/rYSc1pm8VHgqfhndAyr4FHeLEpkwWHg/YeDFXghy
 Xgow==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCJReU4tCuOIXTC32JxNoFVxVsu6x3hxTz1MflWQx4GHTuRxDYtBstJyDj4Yp85VkLP+D6GNUyzGNA@nongnu.org
X-Gm-Message-State: AOJu0YzCmK9ZEQgPoZndBIjva/MQ/sIOgbSKT0R3220JipNF9snHgQ+d
 TCVxi95/1L9nT8Pg9zhuyICNwEPZ6ZdOIiInEdx5O5KTOUao51dXnc8V8KC+Erd7S4dXiPxz111
 1RHCSdLV876WTEqBW+ODLWl7o9BwqEAfvrfkPctGvY+XPzcRFlDvgodUnjw==
X-Gm-Gg: AR+sD12Mu+RdgoQ61s+iOBTw/IV7dHUrwexYl9BsyfDOptFzH0NlMnJSDpl9AFiEBpi
 ocGsXbPFfkGus7+/Q084LuYtw4hJ0lyCKl9yW05kt2erMUXjp8yi5A8ah+09Tq2DVM32rFd+5wR
 MeJ3CmhdVUnktkE5QAqnzztlQBxSTYAlYrQaAfhxcBZJwam+dImTgwOYklUilvFDxnO5Nmf0RWL
 RMtI/DSeUyiGok8wrHO5ptaWW3Rl5V+vyrkveoTDLXQ0I/8cSOcZZyIIPzZg4bZgaw8wYPt+6nO
 vyhWgLuB1DbEAvxD80TpjXn6ac/cg5rXty73WAF04KGvU1nUkH9fMFHFofzRk/myBpcjNzhQEZB
 oDME6PE9NjdFpSBevX5iFPZ8Hy5TjXH+MPtE=
X-Received: by 2002:a05:622a:4812:b0:516:d955:ea6 with SMTP id
 d75a77b69052e-52ce5fbdf93mr453150321cf.14.1786329340726; 
 Sun, 09 Aug 2026 19:35:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4812:b0:516:d955:ea6 with SMTP id
 d75a77b69052e-52ce5fbdf93mr453150111cf.14.1786329340242; 
 Sun, 09 Aug 2026 19:35:40 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800214557esm27855462f8f.2.2026.08.09.19.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:35:38 -0700 (PDT)
Message-ID: <71cc7086-97de-41a5-b03c-4cd9bcdc2cbd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] target/riscv: Improve riscv_has_ext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260809013343.664966-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CYWMtzxU-3G-gWjIrerK4dp6-PdrFDNt
X-Proofpoint-ORIG-GUID: CYWMtzxU-3G-gWjIrerK4dp6-PdrFDNt
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a7938fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMCBTYWx0ZWRfX5N/Oilu1PdsL
 pFn1ytXIqSqwv0fQQHL73sZeI5rSkMzcEezql00Ri38x11DPA2Dut6RJgAwzgXFDHBdN7awcNGF
 4UgsI9jkdKBagEWRptjt75ce/FGEhREhd5XhCiGs7lmbsG1+rNNpTuAOeU6dfCWTdcQbM9J0JXu
 OBYTUiOMeEMELfOg7G271R+dhZK3cFrfFSJgL7rqKfqluJz9Hrw9HfobBdL7W6h5lLXtoX8woLS
 gi10MKc3MlrcI320iIk2Le6+vQKfIGg3h+s+SGF71KF9lHCUu5hgmqU+dnjBR9VIJ+/oJ/5iVRt
 5QinKmh5O+mv18bvnkDqZ/UdnAl6RRcVqI4CIwBuzk3lIafMXKZXT7FH5eWiTP7f8HSadQQCvJr
 dlyzZInECvCNgrlDfDfE01SkTZSZNhjL96kmqpt3G9SyWZqYBcsFRxVFL5+jkE1n2fLAVqmxe2h
 vMhwUILVii3eD1AYAWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMCBTYWx0ZWRfXzjf4+nrViVJ5
 CrBesgyL/rfGNR6BcD8AS0lWdJ81AIIoFGMM+D+Acr7IvkJmvDkyRKuHQAsHYzf7AhZkHGU467j
 gfo9yYsGS9uIRjR6kvIViDMkSvHoRho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100020
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

On 9/8/26 03:33, Richard Henderson wrote:
> Constify the env pointer and return bool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


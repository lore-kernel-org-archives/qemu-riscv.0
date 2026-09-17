Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4CCC982D2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:11:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Fe0-0002Hf-TB; Thu, 17 Sep 2026 13:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7Fdf-0002G2-9x
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:11:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x7Fda-0003W2-Ve
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:11:10 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5Z9Z3437483
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X/qzGqqmFA9h9uBfZY89IhzbfuoCEb26SKcQvVBkvb0=; b=n5FcacdanXFmckrn
 hEWigGIhKl1tY2U8l66pXuZr9iql1iaa1yaKnHc33PsfQnFNd3hcA3wbXA1icQrW
 HAt9aLowpDOe8MNfEjjmZT7bjiq0zFtgCu6J5AGt/2Xh08u9edzEaNT6o3AnmvLu
 Txw6Ub43JifQ06TI13SdkU9xLG1h7YGoezwYo1hFfi7cwtXDDUTszgeeqGHl0aRo
 fl29TbxWs0CcqkQPZGoyeYrQs0U+/34XUy2FqBzwCNxFzEVplbgJbPhCNTmNLsGm
 XT9MV8aM23ZnMXNcE9kOhKldqm+oOvY/Zi+rnf4lBcVMTTVdbic6e+TRuKOZgeRJ
 +WPMnQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6j6d9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:11:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1bbd7d6e6so1027574a12.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 10:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789665063; x=1790269863; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=X/qzGqqmFA9h9uBfZY89IhzbfuoCEb26SKcQvVBkvb0=;
 b=FicqhjHLBtoY0c08wHtAZKljuj3aV19AGsIWREcAqLncd9DyVaEvLezToludXtgjo6
 a4+VX+7dz3+RW6PzdWNiFG9dHUKgdxvD/Clt1AAA4HO089xCMFhhalx8MIPO5MfDTXu2
 O46eOzzyZ1iqCCzmLAH/cw7u9/1FMHhpP6A8BlIktRovYgvqnW65E8LLGCnp+metJ/iV
 baMt6SSgRBJR/FEJxa75MuZmN95guQZMd6kplKBagb2QTyVxQ4HcvDumxkFMtusD4SjI
 JElEeIHma4p1holNTPdET9NzwgKHp3XAW17WlkyEQ/WHV+VnNUQ08W+51XwAoIf8Lzcu
 9z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789665063; x=1790269863;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X/qzGqqmFA9h9uBfZY89IhzbfuoCEb26SKcQvVBkvb0=;
 b=SbTiW/59bGJTW9fTiLT/mpVezw/DQM18J/WiSxKn+ziu6MtEBJa/13ye0tyufIVbB6
 jq7N41b9uTytSO/fVRrAu7Kd1i1pA0HtdpN09TYHMy/YVE1Rcu54FWTR7Ap12blQJmBV
 yOuYrD68Mowgc14YwEtQJCn1ofr+q0Ui1E348e52UL2tQ90b+5AsxlhskV0/t39zHVw6
 5ZShDk9Pv/xlx+DYYi2TCOGFg4LpQMEDCOnan8eoE8c8Xq1HD4QdWhA3YF3yq4DtUr/y
 YMoZqNFfi9Gd98ESQpGvh9EfrQf5PlWiKQU6LF7pHJAKV+384rQkxrXQ2fjjGSd63+Oi
 Lvgw==
X-Forwarded-Encrypted: i=1;
 AKwUvByG2vssF48MVYT2lI16MzfszZBqhai/VgMFcAoLX2XalBgCUEYn+Pxkk/wDBrRMzsQXld1ZYBXruhu3@nongnu.org
X-Gm-Message-State: AFuF++mVTJkrYoj+sbPQpQ9HREGJpnFxbiSjHQr78OLf8oxdAWVoEYwq
 +aAwih4biXG6OsgouSAC4r6TMxZ1/EVMKt0RVaF6fwesIkZvKvKQsKPOk48dsli/XtPZgrFJbx1
 2O5N2D7oCCxNVXJqLCW22isDgaWKldCrTK6OWNOODf/aU6Ks5ntFzHeIOUg==
X-Gm-Gg: AYBFou1E0s2Ozf0QBmamw7j/QexONJcnr0Bek5nBDQoY2US9fvUhFemws+cVslPAz0A
 i4uGMsofulDy0c6tMW84BS+EUw/+1jQBp7JVUuw0ZBzgUlIo726RZaiZmcJJNH1cb9vNbzV5az4
 OKvlZzZcsT6uX/jUWAjyRyMs8yiyebkBjOPYa0urNQm8icsXL1KzqGLhmzYEawt2Akl4HclLt6m
 1pR+/KWNAXDS54U/GzwWToKVrKkd/1JDGokeYzCSlxMor91UqNNTox+n1Fdg6tp2SDRhTK2RM9s
 UAo8IlyXkvgJYQHRZViHIVmW6Dk7TjK1mJgEU9lNsqLQQgik4tZ7wvIY3HOZ+ONRJ+m62yEzBOq
 shZAuXYkSWSpMbICXUtOgo3IHQEr7CJCKKDghnbMBpLXds+HEGuZJV6jBMk9swXEEZlSw
X-Received: by 2002:a05:6a20:6a0b:b0:3d3:ae1f:d7f3 with SMTP id
 adf61e73a8af0-3dd5f73ef30mr18598222637.19.1789665062809; 
 Thu, 17 Sep 2026 10:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3d3:ae1f:d7f3 with SMTP id
 adf61e73a8af0-3dd5f73ef30mr18598161637.19.1789665062239; 
 Thu, 17 Sep 2026 10:11:02 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf596e1f6sm19371296eec.1.2026.09.17.10.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 10:11:01 -0700 (PDT)
Message-ID: <686611d2-d6ca-4022-adbd-49cb7b0b943a@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:11:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] target-info: Introduce target_riscv32
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: luoyonggang@gmail.com
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-10-babc367b60f5@rev.ng>
 <f692f936-550b-4e5b-90ee-399edf21de73@oss.qualcomm.com>
 <CAE2XoE9KkW+WPWL1g4hzT6OtkQhfYvaMAopBW4NfFMkXn9hjzQ@mail.gmail.com>
 <ef62c7fc-9db5-43f2-adbc-e86a805757b4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ef62c7fc-9db5-43f2-adbc-e86a805757b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NFtRQKjOrUZpHtWkRVgTjIv_6Df5hKIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX2bgRjeNr1EvN
 jU5+WQzqxHzgrPhthOt3kMQNErzssYKtlLoQJXLfCk76gSNl6ntgVDrJy7Zr7jY1t3kBOODNiE7
 d2I7RNof2q6REEHJ5rmnzFP9bLppqVUQMtLMl3Om1T23xGzZ2Ul4TyariWTHctBXj7ECvYov2AL
 THl4h51XcLogRorri1QlFclfzp/BHsrdtCRBdX/14fUt1RbVupJ995B1B0no/P7qYMc1e4vUI/I
 1NZPQMCfIS9A4Va2ynRpV7ewPEQr1mn02E2H5rPp8kq0W4ZnRWqm2q67EenhffeDgBqB++URc84
 g9kdkEf1T/XTVkmm5uvUr9wJa38JaGNnSvCgb/qFVMhLOSIrcfkC57XD1Ef+QL1SGyPvNcYkD/Q
 iB3ESwTgaN3VB+X76/gFguNfcpLwPz5+aGA23Mzqv4i1pDWep3yQF/1iOtV4pXpxq1Sh8VzlzSz
 1iSBRaegJvR/2ZHddfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfXyC+WvahXgqy9
 0HT5+8VXZmznxzDJF9o5tK0ij6ORUcyZDQTD1S9U9EHDN43ZYDDJC0IvUtM9fnJJaF6JPnAvH7Q
 pnhH5QSSrk4b7oQFYFrOyUeVNHoDD3Q=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac1f27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UNydBOIn-IAKdUVdJZ8A:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: NFtRQKjOrUZpHtWkRVgTjIv_6Df5hKIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170245
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

On 9/17/2026 10:05 AM, Pierrick Bouvier wrote:
> On 9/16/2026 6:00 PM, Yonggang Luo wrote:
>> As I said before, we need the `const TargetInfo*` parameter to for
>> is_avaiable.  I've get all accelerator and i386/x86_64/aarch64/arm/
>> risv32/riscv64/
>>
> 
> In general, on QEMU dev, we can't block other series to do a change
> compatible with a current work in progress. In other words, the first
> merged wins, and the second has to solve the conflicts. That's sometimes
> frustrating, and having worked on single-binary for more than a year,
> yes I confirm it's not always fun to "cleanup" behind people patches.
> That's part of the work though.
>

I should say "request changes" instead of "block", because I know you're
kindly asking for it.

> In this case, this series is based on upstream, which doesn't have or
> need this parameter yet.
> 
> Also, in the series where you introduced this parameter, the usage was
> object.c: is_available(target_info()), which is strictly equivalent to
> what we have today. We asked what was the goal but didn't get an answer.
> 
>>
>>  single_binary_supported_targets = [
>>    'aarch64-softmmu',
>>    'arm-softmmu',
>> +  'i386-softmmu',
>>    'microblaze-softmmu',
>>    'riscv32-softmmu',
>>    'riscv64-softmmu',
>> +  'x86_64-softmmu',
>>  ]
>>  
>>
>> On Thu, Sep 17, 2026 at 1:03 AM Pierrick Bouvier
>> <pierrick.bouvier@oss.qualcomm.com
>> <mailto:pierrick.bouvier@oss.qualcomm.com>> wrote:
>>>
>>> On 9/16/2026 2:19 AM, Anton Johansson wrote:
>>>> Will be used in the following commit to filter machines using
>>>> TypeInfo::is_available, so a simple !target_riscv64() is not sufficient.
>>>>
>>>> Signed-off-by: Anton Johansson <anjo@rev.ng <mailto:anjo@rev.ng>>
>>>> ---
>>>>  include/qemu/target-info.h | 7 +++++++
>>>>  target-info.c              | 5 +++++
>>>>  2 files changed, 12 insertions(+)
>>>>
>>>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com
>> <mailto:pierrick.bouvier@oss.qualcomm.com>>
>>>
>>
>>
>>  include/qemu/target-info.h | 30 ++++++++++++++++++++++++++++++
>>  target-info.c              | 26 ++++++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>
>> diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
>> index 0620a3db84..560d589bcf 100644
>> --- a/include/qemu/target-info.h
>> +++ b/include/qemu/target-info.h
>> @@ -239,6 +239,36 @@ bool target_is_s390x(const TargetInfo *ti);
>>   */
>>  bool target_s390x(void);
>>  
>> +/**
>> + * target_is_base_riscv:
>> + * @ti: TargetInfo to inspect
>> + *
>> + * Returns whether @ti is RISC-V 32-bit or 64-bit.
>> + */
>> +bool target_is_base_riscv(const TargetInfo *ti);
>> +
>> +/**
>> + * target_base_riscv:
>> + *
>> + * Returns whether the target architecture is RISC-V 32-bit or 64-bit.
>> + */
>> +bool target_base_riscv(void);
>> +
>> +/**
>> + * target_is_riscv32:
>> + * @ti: TargetInfo to inspect
>> + *
>> + * Returns whether @ti is RISC-V 32-bit.
>> + */
>> +bool target_is_riscv32(const TargetInfo *ti);
>> +
>> +/**
>> + * target_riscv32:
>> + *
>> + * Returns whether the target architecture is RISC-V 32-bit.
>> + */
>> +bool target_riscv32(void);
>> +
>>  /**
>>   * target_is_riscv64:
>>   * @ti: TargetInfo to inspect
>> diff --git a/target-info.c b/target-info.c
>> index 9083b7bca6..a9fcd1c07b 100644
>> --- a/target-info.c
>> +++ b/target-info.c
>> @@ -250,6 +250,32 @@ bool target_s390x(void)
>>      return target_is_s390x(target_info());
>>  }
>>  
>> +bool target_is_base_riscv(const TargetInfo *ti)
>> +{
>> +    switch (ti->target_arch) {
>> +    case SYS_EMU_TARGET_RISCV32:
>> +    case SYS_EMU_TARGET_RISCV64:
>> +        return true;
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>> +bool target_base_riscv(void)
>> +{
>> +    return target_is_base_riscv(target_info());
>> +}
>> +
>> +bool target_is_riscv32(const TargetInfo *ti)
>> +{
>> +    return ti->target_arch == SYS_EMU_TARGET_RISCV32;
>> +}
>> +
>> +bool target_riscv32(void)
>> +{
>> +    return target_is_riscv32(target_info());
>> +}
>> +
>>  bool target_is_riscv64(const TargetInfo *ti)
>>  {
>>      return ti->target_arch == SYS_EMU_TARGET_RISCV64;
>>
>>
>> These are the helpers I needed, that are very important.for subsequent
>> work, otherwise the latter work will be repeated again. and split 
>> target_is_* out again.
>>
>> Those is_avaiable should use target_is_*, that's differ from 
>> target_riscv32 and so on.
>> --
>>          此致
>> 礼
>> 罗勇刚
>> Yours
>>     sincerely,
>> Yonggang Luo
> 
> Regards,
> Pierrick



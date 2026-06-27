Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F255C43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 07:00:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdN1p-0007HR-92; Sat, 27 Jun 2026 03:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdN1m-0007H6-2P
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 03:00:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wdN1j-0001iR-A1
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 03:00:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65R3mPXK008759
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 07:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GVjJ1XY4gBvRjyjVIi8ix3Jte5BtLtfLPVpB9OgNuP8=; b=Rc7MCtv/O5tuxVmx
 8MdpCMhkXYHO6aceB46eyF856AOZvZOmqbdfh7pzKhgjnjn6ISAiCYtlOdxLRckd
 +yOh/+SlpwSnroe7qy99JCqT5aOcoscTgstMoLqQq98+4RFa4vISOalQTHxWE+mM
 Krzm3bBO4Bxkw7WiAifpD5IaQDkAkH9iYRT1s6lsuU7LddeMx9If5OcMAEOM49OG
 H8gXGrC9xChNC/eBGCLvPl0Rsfzdr+i04dt8mSH/Gx6F8khChx/memJ9Kah5L2dk
 RRw6ClkUG5sauNrHq3WxIgxutiqvBupEhkMG701gvlQABA1hQekfKqR5fLhGZ02x
 Fxx/Fg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8gac4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 07:00:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30bccca5620so2411619eec.1
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 00:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782543628; x=1783148428; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GVjJ1XY4gBvRjyjVIi8ix3Jte5BtLtfLPVpB9OgNuP8=;
 b=YIdpIjx8W7/uos/Q5QTkQYwXyBJIvAA8RJfXXfs+yTsiGu3JPJW7HI82xTKFcC9Jc/
 +8EqpCCss6adxpkAroDEfqt+vhhciZB3npN4jygqqY6gCIWOcaX7LiiBUUv0mNNYDpzJ
 xYzDpwJfeZntSJ46qjA2gJXifXaAkesRHrn/3coxNu87cuNDx9nfsRcE1SagfAgteenK
 i3+lvd47uXicj8NyzZpbtRZ9kU6u/o1M7GYdy19R+pO1Xc3iOlb8604UQHmerldp++2J
 5s5CCwP/dEvaNafONxcQeT9C69bT+XT09+vBy5PW4wQ9EWBu06MEJ6upGUdI5pVlGaQB
 Pp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782543628; x=1783148428;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVjJ1XY4gBvRjyjVIi8ix3Jte5BtLtfLPVpB9OgNuP8=;
 b=bpg9PryrSmhDSgnHD71hyXd3WpTekGUZXtWaVOSk2+zXw3z6GSkyBbu2V3weQCcL24
 3lIoQMwFoempOQQBnd+FC3nGNz+AtVROs4SSylsMOCSMk48+RtBp6vJioQ+Kn8Ug8q++
 kFQL/8ZjPKZHxFHjetKH8sY+txurxVK0+ec4YBLLM6yBMPMeEzoxk/QDSrIijb8kYjyl
 dfU/gCtRiNPYD+MLMgM7OULu+nWmHACq3QzZxPHVwF5xStb9Rzi6lw0r8UVOTpTegG5G
 kppJjPLhpxzFkkZjBJjc+0G1/ESnzXMvAWLOXOX3N4vrPoMFP1ZjCTwHDRpjSL1WvUkS
 kNAg==
X-Forwarded-Encrypted: i=1;
 AHgh+RouYQ8D+/k9XNHTt5rmftJFXvYTejoDVS2q2yRuLhbW7wXrXzkbzY5LiM67FuYxmctdgxK64R1j2XZm@nongnu.org
X-Gm-Message-State: AOJu0Yz0sPIxhnEsjjxf9OLvMMe1bhmLYIWh5/hhucd1QBxD4rYuNvE0
 d0BEnUEmxT+kG+LPvRv+9rQsD3+2Wtb2M/rklifRe5cwZWRUvup0cChPHSl0L+4M5wjDA6U0TZT
 /zEB4Qq/y3j7Fg4lZ4GCb8a2grH01WvPRD+SvaJaqoZGhx/vCeIk425k2NA==
X-Gm-Gg: AfdE7clY8SgoHWrydgoahafFv3gZ2zQ5btm3oSE3r5cCJZXCzbJJSrYAJES7Klfks9o
 JKdsFZbJDx8PC1xIO/+1po+Vfw6hJIElIrYoKHedX1/meC+eKrwPUIMaxhA0nmhtVA8jC4cNdVE
 Mex7gDLXhRpDDKB1Sb0kGPGCt/lQTLDAEE27kJZ8HvT7Qa1/3vj/8SHJGqBMK2wRcrZ4dhNpBs+
 gZCy+Wpc0uBcMQtC9daJOuOSn3QyYQ5cpYp6zk1e4r4pztQ92HzPcHhaBg5r34+gf1XjXK9VcRU
 kjSD8dSBlLgB0rym+CFXIQbptnmiWOo/JL0Fy/u9Ckpqpx/cbnArCtHDqTATNm/wGyM3gK8uhOC
 ZYoBiacOsh/is7Gq20Icpq79BvzronmvdvgH/eRkzHTu3HBGTyyNXGkJ/eLZR6wFyeueDaCBsPH
 ziAY8=
X-Received: by 2002:a05:7301:4e8a:b0:30b:d865:4bd6 with SMTP id
 5a478bee46e88-30c84eba981mr9387523eec.22.1782543627741; 
 Sat, 27 Jun 2026 00:00:27 -0700 (PDT)
X-Received: by 2002:a05:7301:4e8a:b0:30b:d865:4bd6 with SMTP id
 5a478bee46e88-30c84eba981mr9387478eec.22.1782543627127; 
 Sat, 27 Jun 2026 00:00:27 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30ca5f14f8asm10546063eec.6.2026.06.27.00.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2026 00:00:26 -0700 (PDT)
Message-ID: <b10ed0d4-7a8b-4bf7-97b0-e4e973d392d1@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 00:00:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
 <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
 <704cfba3-e92a-498d-928b-877f7f7641fe@oss.qualcomm.com>
 <9d2737e3-34f0-4f68-813b-37059615bced@oss.qualcomm.com>
 <CAFEAcA8660BZOmX_KXeF7JJaJwgKO3zSRDEmJURg27FK=tqbZg@mail.gmail.com>
 <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
 <0f2205d0-06b5-40ad-9952-e18a6a951078@oss.qualcomm.com>
 <fe77f7a1-1a31-457c-9dec-e1b49cd35371@oss.qualcomm.com>
 <d83a2e21-403f-4146-b129-4d9ee264282a@oss.qualcomm.com>
 <20260626-mustard-beluga-of-perspective-8dbebe@lemur>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626-mustard-beluga-of-perspective-8dbebe@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA1OCBTYWx0ZWRfX27cT09AscjEy
 dk/Jh6HksMuXGUgZt55/EYsSlBBgHzlGdo2S0G7IhVRz4P/XAo/Adfgms/ac9MTyOPQTUOblC9a
 pRA1LvzQF81fCxaeQQX7c52fJPoqVak=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a3f750c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=oNgn5WDEn9JSsLHWEUcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: yI6DdKOFev0enpnwygl_SF8iQw7v7day
X-Proofpoint-ORIG-GUID: yI6DdKOFev0enpnwygl_SF8iQw7v7day
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA1OCBTYWx0ZWRfXzDwnsFuMy8kd
 zNOE6NMJTHcq2RThySVeRtc/vtDRx2Z6+n+rDhaobuJbEClVm1UXhlWKxOo1enSmhASY/m8x66X
 0WeL5W0wIFvgriF1OiJRIKSTGttVBIG969S/azvc4sSWAF0b60cNR5DrMZAzoua5cKuWhfdAeDi
 4rY+l+j6Me+g40493uQlXpZ9gXkw9OJypklDj8mas1e6B5VmZiolYpVv6VtxxGouuQX1A+Jf5Sj
 3Qi0zbAkpiaBaKIEQhWfJZfS2adjGukg4noaWaYul5HzZmDsCBrbOwABu6a5BCcRQ3ZqaQujgZE
 etf+Kys0e0p3DvQ874pCIpnyTEt3E8Gc5GrhyHvUVNaBgAnh1C/qXqwoyansc5ga9UA3Y5CDRWG
 Duj0GmHRM3ol9cw7K9etA2vDgL6Qk4ztLJ2eJvoA5E1I6vuzjHrwrZZ+HUKYpyzGyNUGTBdSRI1
 36myRWL+Fy7f5Zu6hMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270058
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

On 6/26/2026 8:31 PM, Konstantin Ryabitsev wrote:
> On Tue, Jun 23, 2026 at 12:16:56PM -0700, Pierrick Bouvier wrote:
>> Based-on: is a QEMU specific tag, that is only understood by patchew,
>> and no other tool to my knowledge.
>> b4 has base_commit, which allows to give a specific base, but not a
>> specific repository. I'm not aware of any b4 tag that allows to mention
>> a base series. It makes sense, series are not branches, and stacking
>> them comes with a lot of problems.
>>
>> So it seems like email workflow is quite limited in this regard, and the
>> only way to deal with it properly is to wait for base patches to be
>> merged, or include them in the series.
> 
> You *can* specify dependencies with a b4-managed branch, via --edit-deps.
> However, both the contributor and the maintainer have to use b4 to retrieve
> and apply patches for it to really work.
> 
> If the maintainer retrieves the series using "b4 shazam <msgid>" then, if the
> series specifies prerequisites, they will all be retrieved and applied.
> 
> See https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies
> 
> It remains marked as "experimental" simply because not enough people use it
> and therefore there are still many corner-case bugs that exist and just
> haven't been properly discovered.
>

Maybe I missed something in the documentation (feel free to correct me),
but as mentioned above, it seems like b4 only has base-commit (+
change-id, message-id, patch-id). In the current discussion, the need
would be to specify a base commit/branch + a base repository, similar to
information included in a pull request, thus why I said it's limited. I
didn't see how to cover that with b4 or any other tool and email
workflow, and maybe it's not even a good idea to be honest.

> HTH!
> 
> -K

Thanks,
Pierrick


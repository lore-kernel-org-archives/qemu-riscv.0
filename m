Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241CCCD6E44
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 14:30:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSbkn-0004v3-AZ; Thu, 28 May 2026 10:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSbke-0004hN-RN
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 10:30:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSbkb-00012F-GJ
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 10:30:24 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64S8vcnr566560
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 14:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JjKngCH+tN/DN3kMGAPIRvmTGn60U/+B3RchTraZprM=; b=HqpgP86jObG52SDP
 Pqvc2jq4wRlYdh/MX1/IGI5+TzKosi/09c0PB2c+aDFeplnNI5vQ8cvVooriVb9+
 hPFOA3KF/lUXhuJex/Zriqf6R1t1PL6MoPehOm1ZTiLS8TP4Ojoy690I+ulO71aZ
 CXWmMaMTpctFE4BY8qvjO+V+rJaWCi/cBWeYFmTh7e2FBBvlGMcX6C2FDH9/bymd
 E4ciRVQbgAKf/yD11lsxCh5NRIR1qj/usEuKsP9kshRLPgV2TkRV1qOKOEKjn5XR
 6fPlJACkyKgKEXgPYDIqJaohZ1N+U5/LNKa+HWfo8ett7FOM/8lSzgbVNEInBP3D
 q902sQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynk2ys-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 14:30:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304df51ff3eso354192eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779978619; x=1780583419; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JjKngCH+tN/DN3kMGAPIRvmTGn60U/+B3RchTraZprM=;
 b=cfPt6YqhvaZDEE1ojDvovkAemYLHxiALHzDBDxN8IXOibjuR/jQMdxdUBCPt0qZt1E
 iMW5m5TIo/1ps+Flgx2XdBuen7o1hMyiZmVW/iVt84Go/Gc0Omr1BZHHNwHXnUxEosWz
 KeAlt7dx1OxYiGYl/mf9O+udscqv52RNm6iij+/ZpkteYUS8E5sZlHCege5X3vLfxYdw
 E4bhFjC7/hSoG4dw5El4a0ne7NBmTQKm6VpbEkNcoanOsUUy6cIAksQE+dKfqclDKsHj
 Bl42/g8pei53ehSkX3huzjFL6CelxKEHKGMElCrVbPBtJsBsX1G3S/Zx/A+qfTzGi/6W
 IVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779978619; x=1780583419;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjKngCH+tN/DN3kMGAPIRvmTGn60U/+B3RchTraZprM=;
 b=eOc8M3mVSf8TIt66szcUXv1pmPQjFE0GeDNEG4AKTWDcMb94f2PlaJKWDf+gFyq049
 7eSg63GoGVqyT1pa8Ie8oxO70IgkFTtnoPXnEhkfXcWGuhAWOsFWaO3Itf9Q6Ij5YzpH
 e89NY3DEi5hcIX5IuTegmTEFJs4j7Wlcsz1WhfT88swEXcOC8Bydc6x+tdU3cgS2bHsg
 LQFajYAhw7B+LUY9NV8HtMcWcreF6iEqQiPQpqaq0/HaEIoMlpEpy7mLgqTq9ywljDGs
 Rye5A+XgvQzRSoUhitIpqCCgfye8ZIaLgnV+u3kNDmDCGIppyLM/EH+LQcPd0yeRZr/Y
 Tv6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8E3qpDYADZnytXZhec8tsNgWQyBjUiT71UT74vh3Pw2HXgeTooK70v8I9Sly09qZo/Vi9pGr7B3p3j@nongnu.org
X-Gm-Message-State: AOJu0YyPlRqOEsgAI+3gmcj6rCGhexefTYSyX14hpVW/tinzZW8cvriF
 ZP9sMloVLyu0wQmI7eLPpeBhzFIry/s6MEuA8jOhFbtsvGE0jkmPKiOZEL6IqI0B1JoPSfzoMah
 YsonReggpuABcrYlJNvUT1jYV83UXdHWuOkVFNitKE6hugrN8f4Aee4P8Nw==
X-Gm-Gg: Acq92OGuSR/BO/eCTWvV5EI3eL1tgmjQogxbBp1zbONaO0xc/gwoNy3coaQDhsVX/VA
 Amk0zIKiz450kOwujmUVRd3v41nJLTYEdLNU2ysKqwIk3puHXZv85VnxbJCc3vTRbnpjDOmtV8u
 wD9+Vu7X3/4W5FmnWFY0Hno+MlAYhvz1g3tDcfoBh8xdUhkm+I2nVSUst1FdkqvYllb5/3VfPGb
 cl3mvGWvDEUEh8Qfb6nFOV56VdATmmtHZ4lXH20s6FqAT+hZ2zFEtmUft71ucsXzZXq7iRyeUWM
 hWmcd1wbH4zQpNIWQvIpCZs0FJ+I19zm5ckbDb54wQwY8MtqILOnD3NpdnTGaRDZaUpQlH9Rqve
 BZowUg1VhHh7ta2FGR0i1MCyvFLmr2KO5W6nDZQUD/bYv5viXrF7P2XD3RElb8EoZaoQtYS421X
 L8xt/OAi5TX58qvwsDZMWD6pjT
X-Received: by 2002:a05:7300:cd91:b0:2ed:e12:3769 with SMTP id
 5a478bee46e88-30449228424mr11544228eec.31.1779978618607; 
 Thu, 28 May 2026 07:30:18 -0700 (PDT)
X-Received: by 2002:a05:7300:cd91:b0:2ed:e12:3769 with SMTP id
 5a478bee46e88-30449228424mr11544154eec.31.1779978617834; 
 Thu, 28 May 2026 07:30:17 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3045245d6aesm14720790eec.26.2026.05.28.07.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 07:30:17 -0700 (PDT)
Message-ID: <afaf1562-cd2b-4da4-b7e4-f4e699b750a1@oss.qualcomm.com>
Date: Thu, 28 May 2026 07:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] target/microblaze: rename helper unaligned_access
 to microblaze_unaligned_access
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Fabiano Rosas <farosas@suse.de>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-10-pierrick.bouvier@oss.qualcomm.com>
 <41e70c92-99d0-49d5-b233-a7f80f863f8d@linaro.org>
 <33274371-2cab-4132-a4ef-0497c7ffec3e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <33274371-2cab-4132-a4ef-0497c7ffec3e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AKgkDQF9V86bh7OSp2EzwSGmfoO5T0Ck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0NiBTYWx0ZWRfX775PJCW4rRSb
 icL7UQIk/CfcSZmxTyMZGUmuzza2KcLwljUpEK0djBlDlTqMb7FCsoxuLfs6UnWRiCrb8cPm8wZ
 BjshIMuFtw8Yd3cwZDr72r0EJo6GSnP9FQwP0rT3Q43bo0ytMrFIoXQJHeaqNM5Rnt35vErHoMb
 dkWBbsUdMnZraCHC4htqaMOm7wg4EOz51LPRRr39IrfGXWViH53Hifq91gPSRW3KWgVmIEdgNC5
 U2Srce1OjVyeTmF+KiTlpCYUfk5PDj1BOwMBvlcdtfoycHgbmS3JlulWMmyeOZz46IzUjczi90R
 Tz+l54rZT7C3j4gt68qBmmcQbJ3+4yGahqFTYnr7q6e/ekHofpoUZoAN9ReE1OEXK5BbpDz8B+7
 +Ef+q01aXqUlSkxjgiZ032/gHPCRM0/W+viWmnb57cO4nOjM7qPeUkT+4P2bPerqKhKLA4c4Xuq
 B0awIsNoL3MCGZKZZuw==
X-Proofpoint-ORIG-GUID: AKgkDQF9V86bh7OSp2EzwSGmfoO5T0Ck
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a18517b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=sUTfoMr8b-0mKdkWX2sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280146
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

On 5/28/2026 12:27 AM, Philippe Mathieu-Daudé wrote:
> On 28/5/26 09:24, Philippe Mathieu-Daudé wrote:
>> On 28/5/26 07:16, Pierrick Bouvier wrote:
>>> Solves conflict with aarch64 unaligned_access.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> ---
>>>   target/microblaze/helper.c    | 2 +-
>>>   target/microblaze/helper.h    | 2 +-
>>>   target/microblaze/translate.c | 2 +-
>>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> Duplicate of this patch which you already reviewed:
>> https://lore.kernel.org/qemu-devel/20260224193028.2370-4-
>> philmd@linaro.org/
>

I remember you did something around that, but it didn't cross my mind to
go see if you had such patches in your single-binary branch.
Problem with checking someone else branch is that there is no guarantee
on branch status (build, checkpatch, tests).
 > The point of this comment is to avoid duplicated work (I thought
> you had these patches in your branches). Should I maintain some
> single-binary-next branch in my repository with these unmerged
> patches?

Continuous integration is the answer: we need to integrate things
upstream as soon as they are ready.
The best way to have this solved is to pull those commits once they are
ready and reviewed, even if your PR has only 1 commit.

Luckily, this one is not a huge duplicated work.

Regards,
Pierrick


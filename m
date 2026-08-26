Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35498C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 17:40:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzHbw-00075J-Oc; Wed, 26 Aug 2026 13:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzHbq-00074J-P8
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:40:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzHbo-0004OF-DJ
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:40:22 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGug0r1408693
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 An3jc4mLRIfIXI7XpJm1MFuLoDJIFSLkZykhVxxJ5LM=; b=OkEcxFoTfgqmRUSs
 h9EvyZ0K3YQxgFyV6DZ8bl0Zxud0ph0fLuIBWoHKRlekg2NLVbc2aDbiHZUszm5Q
 FkUGWJn1+FdmByCctuR4jh9BQZmkzNy/HEob3n1Tprd8Ky6Mge3U0wuivmpz964+
 Xnx+VmcjWrihb4aBhzIxOZ+H44akJwFAegzhbTrO6MbBCdDA4iliLyIlIuKn48G/
 kJ+veJB5tPF1gdZrmSqkocBckNeA8mnDNaHTfOOgjYVZQYD4s0Vzmnjy+J83Be4G
 doBVDuKHsMcEzbsqN97duLCyCv9gFPOUP5CH15xV6PH3w7o50cwt75rMk5iko/6k
 gjtQAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n1sg6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:40:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38f5ac7416eso1962894a91.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787766017; x=1788370817; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=An3jc4mLRIfIXI7XpJm1MFuLoDJIFSLkZykhVxxJ5LM=;
 b=e911zJ5hOmC6T7YIpOm9tO7szmMZ0/jKvAc9Kkps+ekDY6iJwcMRJRe02nvrj98eL8
 y91bbZ1ttPvZFjh4uUXmxAnkZFHWvS3KivxGTf7nSFvFJuNblM62DfMEmiP0GZbgX9gs
 9MKljniFHeYZsuEyOmKdMM0Ok18kdha0Q4z9PjGSgXo5VCDQc7gF2f5HMc4CYxmEfIVz
 u445nkf2n+1IcTPopYCfqdIbjPX13/BKMbY/cVyjIvuzQ4horreWdOe1tL764sQ7kRrt
 gdYu6f4AQLz24a0y+J3+ZwdHCKangBFHdjIlYLy8fWxrZnJQqowMmMeYxPw3tjW279gv
 BA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766017; x=1788370817;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=An3jc4mLRIfIXI7XpJm1MFuLoDJIFSLkZykhVxxJ5LM=;
 b=UkCiMirzzFhddLfs+W36TREF4wyR5GYOl38+PuSfWvxK915nvwaMguwiqBJx2QE7wA
 HVFd708tCQxNf+MVysuf8PhDgRVKtFf7VlJSIUAVNaZuLuIZ/UiPkBr5Vx22Nx6zFN2z
 +r8plTvnj7nIriLKZzPHXzzAM9mgZwpW331GtlsfEZl+BPB9BoL8IXpDz/y9z7tNsZMH
 4EJirOLEnuASbXGpeQNkj0PoQV08eYybNgXZjZzrrsagXmfwA4EulyN7ZFyGnuaH36rb
 nTjljrwxvLvm20gjGf5xsjOuENPUXDm0YFLNVKFOAQU2qfbOBZpvn1agTDeARQ77T8SC
 2APg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr+VIM3I5m058FyzzUgEfKiESrddA1/7I2HAMyldgc3EuQTNyk1bOF4KNInmNiaRGkoCy0QXqVDNd9Y@nongnu.org
X-Gm-Message-State: AFuF++kwa5tnoasD5663MefGDW+NdO1qoekv/ZNoPk3Y0/KJCeZK96Wv
 qWOWsP3pAcU3KQcUW7b7uHaVbkmu/HJpFSgSodynmC65L95uSm21cJzl8VLUZZTL1iioi2O2cX+
 Sqn9+HqzB9IpoiEIMpB9sdm/AkjG1jR7qni2+bZ18J7kHCPKss/4m/JTIKQ==
X-Gm-Gg: AR+sD11YxGZF6M65eEZSZb7dEKjnDyq2kM/BtG6/+w5oCAZyBoVMzfNEL5z+qG84xPQ
 bNaavlmX4uLV55mYFetM92uAgfhL1hMGl1BEAJbEaSGIDKZZzhDzwQKhGyfv2V7xGml1viLv4IZ
 CkFsP/+0pKDoavPuFP4tYoYNRxU7O5rO+YJHtjwadhY3EDh9xVFqxcDHyAwqbysIQAkiiGYhvQZ
 MOUmEqLaalQ2oqVXLjfB8xvl6XrrrFEvpQUoa/o63qniU6rTgzr4K8b0s7+7gSJg9imimggqI2c
 Q3mkC95XEIZ6sJLB4qts5Ui1Fe6M2ph9XoMXISrkGVHL9BDP6iyVrC5l3YmS7j9AUPXAdf++jqG
 tHvv1XxWMfPjkys6YHQavstH7qusglHnY3zcnzDKaLYIDcz1pmTOWhk8Aq4YEPPJcdlvY
X-Received: by 2002:a17:90b:5543:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-3966d13eb75mr18912814a91.3.1787766016749; 
 Wed, 26 Aug 2026 10:40:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-3966d13eb75mr18912659a91.3.1787766016115; 
 Wed, 26 Aug 2026 10:40:16 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-32854db74eesm799476eec.18.2026.08.26.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:40:15 -0700 (PDT)
Message-ID: <d7d5e491-430b-4781-8746-eebcc1e4177e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:40:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] meson: link ARM and RISC-V into qemu-system
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-13-luoyonggang@gmail.com>
 <b9f0853b-adda-457d-94e1-add9bb2a2548@oss.qualcomm.com>
 <ao7jWx-zfmB9AUEb@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ao7jWx-zfmB9AUEb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J0fWt5M_WSyue8hstM0xcuPhDGIamRZq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX/BmXyBLq9ZCR
 FEvHNO00x5+FTBPScMYAcXd82+LTnaMeHywKCbB0c5qXlv6YmX2E0iTQXLTOTEiLR6togHimN2R
 aIsF74z++Cr7XIq6HSwpLVn2G+VqKfI=
X-Proofpoint-GUID: J0fWt5M_WSyue8hstM0xcuPhDGIamRZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfX47kZmq1upcuf
 pp4WIcAUb2vzrieUalBQuHzFx/4w6lub7rvk2LZDk6vOkKNuc6iH+eEEWnFn1CoRQQNaBaZ3f86
 MJV7q+GuzXUhraE1RJe5/wIyykvJynLt7jNvJcDn1SF8Lm573mLl4GT2YYSbTdyAcz9OZ2OFjc7
 XQwZ1PCNzKhZ12oAlEq3tmBTSbELCKErHjyH0A0i+tf1QYCklH+ETwhTAYia8lijdmXSgEw15FD
 Q67fnmqSPyB/YEB6ssjD/42iHEJb/xHgr480aPOzKBdAptPdXMNJDOrS59SZDzFm1do3uAV4Zye
 5lQXi3eufi3nSS7fTCNLXDS7XoEkTl+ttDXjL1mKsfVBEW6QH74rM+nZZovxpWCjKB1eq6SLQ+t
 Jg/uUM79EiSifDS0/lsRnGmvUzqXaPTFgpr+1eYOXw+bYzH7mabmGoMjsfsMJ7oW4XwFNUJT2GH
 no/qPPPp5fEahTA5pFw==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f2502 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7dDCaj4Z6oIzDkE3tjsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260147
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 8/26/2026 6:00 AM, Daniel P. Berrangé wrote:
> On Mon, Aug 24, 2026 at 09:20:38AM -0700, Pierrick Bouvier wrote:
>> On 8/23/2026 8:07 AM, Yonggang Luo wrote:
>>> - Build qemu-system (and qemu-systemw on Windows) from aarch64
>>>   common/system objects plus RISC-V arch objects taken from the
>>>   existing riscv64 lib.
>>> - Pull 32-bit TargetInfo and 32-only boards from the arm/riscv32
>>>   libs so hw/arm and target/riscv are not compiled twice.
>>> - Skip linking qemu-system-{arm,aarch64,riscv32,riscv64} and the
>>>   Windows *w variants; symlink those names to qemu-system so
>>>   argv[0] still selects TargetInfo.
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>  meson.build | 156 +++++++++++++++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 147 insertions(+), 9 deletions(-)
> 
> I think this approach of taking common/system from aarch64
> and adding in riscv specific objects only works by luck.
> 
> That's not obvious from your patch, but Pierrick's counterproposal
> below will expose it with a little  tweak....
> 
> 
>> From 6261b0c255e1a8f0df2b41928b8dfb365d0fa488 Mon Sep 17 00:00:00 2001
>> From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> Date: Tue, 14 Apr 2026 10:56:15 -0700
>> Subject: [PATCH] meson: build single binary
>>
>> This is not built by default.
>> Build with: ninja -C build qemu-system
>>
>> All available *-softmmu targets are aggregated, ./configure
>> --target-list can be used to restrict which targets are included.
>>
>> In case user has targets that are not supported, we emit an error
>> message when build qemu-system target. This way, it's not necessary to
>> have a custom configure flag, and qemu-system can live next to existing
>> binaries without complexifying the workflow more than it is already.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>>  meson.build | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 553df3e7f053..4a31a520d9eb 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -4264,6 +4264,9 @@ if host_os == 'darwin'
>>  endif
>>  
>>  traceable = []
>> +single_binary_libs = []
>> +single_binary_deps = []
>> +single_binary_crates = []
>>  emulators = {}
>>  foreach target : target_dirs
>>    config_target = config_target_mak[target]
>> @@ -4419,6 +4422,10 @@ foreach target : target_dirs
>>                   build_by_default: false)
>>  
>>    if target.endswith('-softmmu')
>> +    single_binary_libs += lib
>> +    single_binary_deps += arch_deps
>> +    single_binary_deps += target_stubs
>> +    single_binary_crates += main_rs
>>      execs = [{
>>        'name': 'qemu-system-' + target_name,
>>        'win_subsystem': 'console',
>> @@ -4500,6 +4507,47 @@ foreach target : target_dirs
>>    endforeach
>>  endforeach
>>  
>> +single_binary_objects = []
>> +foreach lib: single_binary_libs
>> +  single_binary_objects += lib.extract_all_objects(recursive: true)
>> +endforeach
>> +
>> +single_binary_link_args = emulator_link_args
>> +single_binary_link_args += enable_modules ? ['@block.syms', '@qemu.syms'] : []
>> +
>> +supported_targets = [
>> +  'aarch64-softmmu',
>> +  'arm-softmmu',
>> +]
> 
> Adding in riscv64-softmmu to this list and building with
> configure --target-list=aarch64-softmmu,riscv64-softmmu
> will fail with this meson approach.
>

Maybe it's now more obvious why our original goal, presented at KVM
Forum 2025, was to have only arm/aarch64/microblaze, and not riscv.
It just requires more work to have it, and iteration is key. But we need
a minimum viable product to start somewhere.

It is still our goal to this date.

> Specifically we'll hit duplicate symbols to to taking
> different KConfig branches, resulting in building in
> both the real impl and the stubs:
> 
>   /usr/bin/ld.bfd: libsystem.a.p/hw_pci-bridge_pci_expander_bridge_stubs.c.o: in function `pxb_cxl_hook_up_registers':
> /home/berrange/src/virt/qemu/build-alt/../hw/pci-bridge/pci_expander_bridge_stubs.c:14: multiple definition of `pxb_cxl_hook_up_registers'; libsystem.a.p/hw_pci-bridge_pci_expander_bridge.c.o:/home/berrange/src/virt/qemu/build-alt/../hw/pci-bridge/pci_expander_bridge.c:214: first defined here
>

There is nothing new here, and we discovered all that more than a year
ago. That's why we started using stub_ss more, as it provides the weak
symbol semantic we need. It's not the end of the story though, as we'll
have to adapt some functions to this new "multi target" world.
But to be able to test and debug that, we need to have a single-binary
first.

> The problem is that aarch64 enables CONFIG_PXB and
> riscv64 does not.
> 
> Yonggang's patch only worked by luck since it preferred
> to the common system objects from aarch64 and thus kept
> the real PXB impl. If Yonggang had instead used common
> system objects from riscv64, the qemu-system would have
> lost the PXB impl and got a stub.
> 
> This is unfixable if both targets have some Kconfigs
> that the other target does not.
> 
> So to be able to build qemu-system, we can't simply
> pull in the union of objects from each architecture
> qemu-system-$TARGET binary. 
> 
> Instead we need to setup a new Kconfig specifically
> for qemu-system, which is the combination of all
> Kconfigs from each target. Then derive a new list
> of objects from that.  This shouldn't involve building
> any more .o files, just means we build an accurate
> list of what .o files we need.
>

It is a wrong analysis, and there is no need to have yet another
Kconfig. The only cases to handle to solve symbols duplication are:
- true conflict -> unify implementation or dispatch per target
- false conflict -> implementation vs stubs, solved with "weak symbols"
+ additional target/config checks on implementation.

The linker has the final word, and we just need to follow what it says.

>> +unsupported_targets = []
>> +foreach target : target_dirs
>> +  if target.endswith('-softmmu') and target not in supported_targets
>> +    unsupported_targets += target
>> +  endif
>> +endforeach
>> +
>> +if unsupported_targets.length() == 0
>> +  executable('qemu-system',
>> +             sources: [single_binary_crates, files('system/main.c')],
>> +             dependencies: single_binary_deps,
>> +             objects: single_binary_objects,
>> +             link_depends: [block_syms, qemu_syms],
>> +             link_args: single_binary_link_args,
>> +             build_by_default: false)
>> +else
>> +  error_str = f'''qemu-system only support targets:
>> +@supported_targets@
> 
> With the Kconfig union problem solved, IMHO we should unconditionally
> always build the 'qemu-system' binary. If there are targets that
> do not yet support the single bniary concept that's fine, just ignore
> them. qemu-system-$TARGET will still be built for everything, and
> qemu-system only needs to include what's currently possible.
>

No strong opinion here, I would be happy to implement a different
behavior for this. I personally prefer predictable/boring software
without any implicit behavior, and guide user to what it wants, instead
of guessing for him/her.

I didn't post this patch for review, just to show there is no need to
have a complex mechanic, and simply mixing object files together works,
once target was cleaned to work with single-binary.

This has been presented at KVM Forum 2025, and we didn't find any
situation that required to change our strategy so far.

> 
>> +
>> +unsupported targets:
>> +@unsupported_targets@
>> +
>> +use ./configure --target-list= to choose list of targets'''
>> +  t = custom_target(command: ['sh', '-c', 'echo "' + error_str + '" && exit 1'],
>> +                    output: 'none',
>> +                    build_by_default: false)
>> +  alias_target('qemu-system', t)
>> +endif
>> +
>>  # Other build targets
>>  
>>  if get_option('plugins')
> 
> 
> With regards,
> Daniel



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E70CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 17:46:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBFQa-0001TJ-JI; Mon, 28 Sep 2026 13:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBFPs-0001MF-Ou
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 13:45:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBFPp-0001YD-Ey
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 13:45:28 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SEe3Va1498527
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 17:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mP052L6B5onsSn1YqwYyBCKOlIaEkYFq8zzE8C6qU4I=; b=dV2Na/WvuHkS26LZ
 2nRd4vxOKNzVEEWhLoETGi3KDPj9XhFJFH5kh3rknkBWuwU0FRDl38EtEfrHS8Jf
 zUtjDRLvEpR/ZG2M0BGTOLskGY9cEmXkjLZlsFXegDhWiKDq8AcdJoqDDmjGYB5G
 vjjak2xehtFft5S/TW0zaz42UTtOlIuEpnU0v3xUcffN2Rre3J599l31v5SMSozT
 FYTEIvrd8DoS+eVFMfDCejE8MDtbIAk08d5fA2KSodSz8zCIsFM9+2Q9DFIpY9Zh
 56XeJSMpGQxUSw1Pzkon+TSduDN5E2gAuZVZg2RWwO5gMBz33cC9EQwx/FuJWnqU
 D4glew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtkg0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 17:45:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91578e96164so5106466d6.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790617499; x=1791222299; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mP052L6B5onsSn1YqwYyBCKOlIaEkYFq8zzE8C6qU4I=;
 b=UYCkoKJ9MbBs0Dulp36Alno9NdxTyXjRcXsbhLwb5JAAGKxSA7Ai6S/ieqk2/43i7f
 3Z2S9ddyCzcBrptwNxbk2stIpyMJQ0+0VL6E4BOV22pozpvq48SsGyV7j6yivoXYakNr
 IgZQl3n0NzvR61QMQqmcqUOVP48XJoYRmvwA7FWo4UeidQnQvbVbjm6JGzcHL+s4vSD/
 WIXc9hXYaaSt1scBkZc6vYl2wJ5Y7ffVK4XqwoU3N8Dcd0TP8+vV+OEf0/BlnEzi8PKy
 W1XPXNobr8bhVlPWGhRsZr9w5GLpM7SdF8CJkPN/U6jx+z+24ynYEVOmbqvMmdqr4i54
 QUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790617499; x=1791222299;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mP052L6B5onsSn1YqwYyBCKOlIaEkYFq8zzE8C6qU4I=;
 b=1S++5L8z8qUhNrhNRKiwC+gadAeANSsRLZiUNZKj1oc6PsYbSiF0CHDlYPBQeke17Q
 LfJ13UlNzPPuHWJ+aL543v5sTCAYR4dBZztnJRAvRgZ7/9f8Cd93+ehBBvybbHiDir/S
 Cf+Blv40sn1YgUIn5qLaamxLcPlIcDQBLtpuDJt24qdvwi8tnmClkgH35+zqpH05L/VL
 Z8/CUZHUBNkpFA4H0WIdRYPzI8xp8AEPGRD8cywXkxg4rjRSCH0QSALhAOEck01GACrv
 jwV0T7XgGbjN6+tPtjqTPK+8QLlXxN7qoI+SpRGpGZc4kg1GBLF3XYp9wb/wWUzAPq5G
 Gzuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmlSENbP6twi9HT80oM27ykKZ62n3PjN2fw/O+dyez/nvccNG/pjabpAOsxHeVweg9aGE/GpGSaf0T@nongnu.org
X-Gm-Message-State: AFuF++n6pcH61I0HQ7zm3eeXEh99oXt0KomYfDxuT5orM6zEhQOtEzUu
 VbBxqgvQ4ROLmouTYcKoCLinmWd037FCpe9zRXkwwL6XpT4SoXxqogCo+3lYJxrIQOrhhy3FgL9
 G+J0pTjJFWSTDawhwOqMAB0dMjHwBQSxYoQ8Tq2/b864N7q1xtIzaduAK6Q==
X-Gm-Gg: AYBFou0AwF2Dv8xUKxDZ4cR1pon7UAQTM+fwVZ36nFhhDpfk6Ss33D/k5UzcrjM8FRD
 N81M+amqbZ2QtEYSLM6xXPNuWhqX01XdNCy1lKMugAPFdmFzUdMgdl9F558y7ZhhydOE6El5t3f
 QvsL55gX2qWGQT/63sV5mYGXnTbWPPJ67WE7hjCzOHDV7PgHz3a57XYbIt+TsfD4gefFLKj3FxN
 Q8z7qjw9UKNOvyP4MMRlnvM+E0/41a1J1H6Kdyw0lkmb9qblNC+9vM4Cj0dNF3BqkGlJTjHSThb
 /UPQR97GcYz2zq+nf4W7R1C++ZsaErHwQSZQajSWImsACfWPjeBLfFlU6W5TWZhFIvdsvVeNsGy
 0+67LahL1CPqv5FqNXomdHr5SOIYeBcqYdZPqcDuXHOg0
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id
 af79cd13be357-93c8bcd086dmr29148785a.6.1790617498537; 
 Mon, 28 Sep 2026 10:44:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:93c:5b32:c9d9 with SMTP id
 af79cd13be357-93c8bcd086dmr29134485a.6.1790617496669; 
 Mon, 28 Sep 2026 10:44:56 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c81598783sm200315685a.46.2026.09.28.10.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 10:44:56 -0700 (PDT)
Message-ID: <282073db-9c0b-4aaa-a634-6fec673232a9@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:44:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] tests/functional/riscv64: add riscv-server-ref
 tests
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Chao Liu <chao.liu.zevorn@gmail.com>, Nutty Liu <nutty.liu@hotmail.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
 <20260917174405.3471736-5-daniel.barboza@oss.qualcomm.com>
 <geavtirs7hw5givjazrneegb7gwqsvmwq3koglyxxcxz2fauy3@j4vobi7nbsh6>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <geavtirs7hw5givjazrneegb7gwqsvmwq3koglyxxcxz2fauy3@j4vobi7nbsh6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 76nJ67tP2_9zUukTy3TymDDy6enFxKv6
X-Proofpoint-GUID: 76nJ67tP2_9zUukTy3TymDDy6enFxKv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX9OzTTvvt1cI8
 7aQ+DmMu6tCYtp3rXyQZ9bRIlPQVnU6IfsCKIbOWnxlqJ9e4MEW4iLXc/YffIOLTF9W5YMNzHNu
 S0eqC7dSDnDI4hONHGvVw24OlXDKLCWaffgVTU8lwR1o1bW0IomSU+OLdmk8uLNAy1MZOb4xrk7
 gptnueHt4Eb8nUcqzT3RkQJ9iJunx6vnoOmZyxl70lpg4xwEg7wCIAxOrftzq+lTU3uHR8RDNAG
 1FOHJYre2S2h+TiJTDouCBg3VSjEABWutTpqbCM67XIr7uaq5qHhJ6R7eNvWnHCB6i5EoeJCAfa
 PvsyRN98KhYUFMsAUhYPO1O06BkV35kbxnv7aI8upb3/yAid0MtFO80XBbolU9wQftTNavx4atI
 TmYVvI6vWN60Q9ej9E4YLOKtec6FrIw07AjiSMvxnvZfUD6UwcTnJYLtvUV+RDlEXNDQoncfnjd
 sdH4GVWSrPbWiEPxf4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX2isXlWlOjENJ
 V/v0AbKiDsvDpnAZ2wx8EDWridrY+OSGeMRRr1OoyqnvSvl+tD2/O11COQSOfWK2v3KAAmspZ4c
 LUPQFkokc0bAlkeKlHaPwDBBDiw923c=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6abaa7b2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8
 a=JF9118EUAAAA:8 a=IYXIzjRPg5gYPgzrHYoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280070
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



On 9/28/2026 7:46 AM, Andrew Jones wrote:
> On Thu, Sep 17, 2026 at 02:44:03PM -0300, Daniel Henrique Barboza wrote:
>> Add tests for the recently added riscv-server-ref machine:
>>
>> - a new test_opensbi.py test.  The idea is to have a quick test that can
>> catch trivial regressions that would prevent OpenSBI to finish;
>> - a new Linux boot "thorough" test that will boot the machine up to the
>> buildroot prompt.
>> - a TPM specific selftest for the riscv-server-ref board.  The test
>> will be skipped if there's no 'swtpm' in the host.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
>> ---
>>   tests/functional/riscv64/meson.build        |  2 +
>>   tests/functional/riscv64/test_opensbi.py    |  4 +
>>   tests/functional/riscv64/test_server_ref.py | 90 +++++++++++++++++++++
>>   3 files changed, 96 insertions(+)
>>   create mode 100755 tests/functional/riscv64/test_server_ref.py
>>
>> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
>> index d1a3e6c2bf..2d22e49efd 100644
>> --- a/tests/functional/riscv64/meson.build
>> +++ b/tests/functional/riscv64/meson.build
>> @@ -3,6 +3,7 @@
>>   test_riscv64_timeouts = {
>>     'boston' : 120,
>>     'k230' : 120,
>> +  'server_ref' : 120,
>>     'tuxrun' : 120,
>>   }
>>   
>> @@ -15,6 +16,7 @@ tests_riscv64_system_thorough = [
>>     'endianness',
>>     'boston',
>>     'k230',
>> +  'server_ref',
>>     'sifive_u',
>>     'tt_atlantis',
>>     'tuxrun',
>> diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
>> index 0f8beb7e7a..367e131164 100755
>> --- a/tests/functional/riscv64/test_opensbi.py
>> +++ b/tests/functional/riscv64/test_opensbi.py
>> @@ -36,5 +36,9 @@ def test_riscv_virt(self):
>>           self.set_machine('virt')
>>           self.boot_opensbi()
>>   
>> +    def test_riscv_server_ref(self):
>> +        self.set_machine('riscv-server-ref')
>> +        self.boot_opensbi()
>> +
>>   if __name__ == '__main__':
>>       QemuSystemTest.main()
>> diff --git a/tests/functional/riscv64/test_server_ref.py b/tests/functional/riscv64/test_server_ref.py
>> new file mode 100755
>> index 0000000000..ad29094dbe
>> --- /dev/null
>> +++ b/tests/functional/riscv64/test_server_ref.py
>> @@ -0,0 +1,90 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +"""
>> +riscv-server-ref board test
>> +"""
>> +
>> +import os
>> +import tempfile
>> +import subprocess
>> +
>> +from qemu_test import QemuSystemTest, Asset
>> +from qemu_test import wait_for_console_pattern
>> +from qemu_test import skipIfMissingCommands
>> +
>> +class RiscvServerRefTest(QemuSystemTest):
>> +    """
>> +    Test the riscv-server-ref board
>> +    """
>> +
>> +    ASSET_KERNEL = Asset(
>> +        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
>> +         'master/riscv/images/virt64/buildroot/Image'),
>> +        '6bacc876c769c1bb6057d2bf549eba67fbe83916e8223f9fe21c8e8fff665a36')
>> +
>> +    ASSET_ROOTFS = Asset(
>> +        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
>> +         'master/riscv/images/virt64/buildroot/rootfs.ext2'),
>> +        'f00bb88749f945d80675540a1338bd1ccb226574685a5b6c65ab44027d0411a8')
>> +
>> +    def do_test_boot_linux_test(self, tpmstate_dir=None):
>> +        self.set_machine('riscv-server-ref')
>> +        kernel_path = self.ASSET_KERNEL.fetch()
>> +        rootfs_path = self.ASSET_ROOTFS.fetch()
>> +
>> +        self.vm.add_args('-kernel', kernel_path)
>> +        self.vm.add_args('-append', 'rw rootwait root=/dev/sda')
>> +        self.vm.add_args('-drive',
>> +            f'file={rootfs_path},format=raw,id=hd0,snapshot=on,if=none')
>> +        self.vm.add_args('-device', 'ich9-ahci,id=ahci0')
>> +        self.vm.add_args('-device', 'ide-hd,drive=hd0,bus=ahci0.0')
> 
> Any reason not to use nvme here like the documented command line does? We
> could drop AHCI in that case.

Didn't find a way of booting a nvme type disk with "-kernel" that produces an output
compatible with boot_linux_test.

In the (hopefully near) future, when we have an upstream EDK2 firmware compatible with
this board, we'll revisit this test.  We want to have the same command line we're
reporting in the docs.

For now we want a sanity check to see if the board is sane.  Using AHCI is good enough.


Thanks,
Daniel


> 
> Thanks,
> drew



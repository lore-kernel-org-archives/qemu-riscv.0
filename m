Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F7C79FBB
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 13:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4IQ0-00056z-77; Wed, 09 Sep 2026 09:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4IPu-00056F-Kr
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 09:32:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4IPq-0005BF-WB
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 09:32:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BU1P91810006
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 13:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t7LjnAahdGyKDVmM/szv2AcgJF+dliGyaokTG9V3aeM=; b=IJXLAWjYph+ft3Gf
 AY4m5JU/lCpc7/NMJeN1RAYg4KwyTJLkPWSkg/UIuRGx9NqRhdktP5/dSaUda8Jp
 LJNU4ndn7JvGe5ercVZDOKtbcJT+x1VtEKNVjtrjxJL3PIOp0WJCbpZdfs2O6EwX
 IH9hSupaz+3yabOAi3TEL9flJ5fRb1eLaMXp5893A9H/k2NAI2rqY9bFLSDkSy2k
 oWYsw/0cggYpgg6g94QW9GDV93LsGooHjmjRUQwInPdBMCwWwyGlm/FtL6KAAjl5
 R/p9XseUvD4FHdon5Mt+UOWUNR0x7hAKP7Wfv8XWFiyKksL7qCbGwrfjWuWi59zF
 Q/oC2A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj0vnp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 13:32:39 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-4b37733badcso7386110b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788960759; x=1789565559; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t7LjnAahdGyKDVmM/szv2AcgJF+dliGyaokTG9V3aeM=;
 b=KSG8UqG6cutp4/o33X5mEWS8zBLiiGC244K5NKpAvzS/HJXz7OM/rAr+xJZ4ss31Fc
 5+4dU7iMpW9PNxpe4dgJ8jEn6l42J4X5w+cmPY0kTeByZXG9HG3LV9BDVDfoJptfoU0u
 NpqqzBrRTeUGotfJ7ov4Kul0p0YGokQr6qpX541QhbVbd2R/4UBJzwZicaYe4Qr3/sM4
 FumOngDaaRzizDfTo/TdHJAAAGkO7RTGDBVvwC/7JdglXD1oDnZAa0b1mWzOODwLXJ9l
 6xb68MLvVb2h9i7t0Fto/Bg24jn737aP11CKZrHGPGeOMZpET67m0kHMvDikvRCYQUmY
 c9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788960759; x=1789565559;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t7LjnAahdGyKDVmM/szv2AcgJF+dliGyaokTG9V3aeM=;
 b=Hj3R7+xJgbX91IILbeScHEiUHxhp/tk8WZ+azSdAPVyTxm5Gjw9bteYiDOTOvdtHyp
 Y77bOttRWXCTNGgBPYcMr+JZLCAwyL0yXsMDuf6Cq/et333ua7OLGvRxgCo8SemxyvLF
 6EQSiY3VhdjXd6xhJsK7xwVRJwwF7Qymy9KSI59nmlTqUNsZbDubiTfSN2gNOQV472n2
 rx7Kb9vxaJqqMPEF+XF6nJir+0xckz44cb1uax95Yz9Sdm2ya3sYWor5fhOTNnB/Nzzv
 plZ18aTvQk+hesXN5imT5fAx0w/22zW1yff3BLrLGTpr0Qj0TJ7bUZQPhcXvRrGlaqW+
 udxg==
X-Gm-Message-State: AFuF++l/q+igmAKPeFkt7zuRw4a6zEwfOFkjAx0BQCyo+/vWVnAACquB
 XYIm3ysP7UV2DjlVfsqg2iXXwJ9cKiN2L0cNFDW/iqBrSKfUcoFEfy8pyMeqrj6aI3HM5ZBho7l
 WJhu3Xe6B7I9fEmGvwuaO+kWMg2UvcNHZgb7CKMOdkD/BAKfhfa8lreX6bA==
X-Gm-Gg: AYBFou3VSA5iYN9bKDK4KWiusM3+JE/Dn3cEIv0NOJmoXk1mIDybOhocVutBSdMQH7h
 GNs9+aiMk5/oOmCOuIBxGRLyNtxA3UjxiPY3+mtwGerqxH7gmWUyxBQxCkxHbD1bkrX/9gQjs46
 fQhUD0J76CYaM+E/bb5RUpply8ELvRa6sHbIM0oE3nW8XfZd/2zPxitTIxP9F7kqo4U6I2Yc/ik
 Y022a5nzG6S4WnZoj17DPPM1FrRvJBmg3P4VAGyEog2+3vFHj8VOW2wDO3UCV1kd3cuBfSiMaCQ
 QkTkHxzibpgwGuMW5LTBTS9LOfe4RjjbaosqUA6hJU3OWFoN7vygsruUPkIjY3p/T4DMdj2vFNG
 MZyAeJ/lPysPyazCCCNCQnXC+JBlJwDXV0l4=
X-Received: by 2002:a05:6808:4487:b0:4b9:e5fa:890d with SMTP id
 5614622812f47-4b9e5fa8d80mr18245156b6e.32.1788960758624; 
 Wed, 09 Sep 2026 06:32:38 -0700 (PDT)
X-Received: by 2002:a05:6808:4487:b0:4b9:e5fa:890d with SMTP id
 5614622812f47-4b9e5fa8d80mr18245124b6e.32.1788960758148; 
 Wed, 09 Sep 2026 06:32:38 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9857ce120sm1623463a12.4.2026.09.09.06.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:32:37 -0700 (PDT)
Message-ID: <a45bb8de-bd10-4745-9865-7f277fec148d@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:32:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] riscv: add initial sdext support
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20260907114615.1609913-1-daniel.barboza@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907114615.1609913-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MCBTYWx0ZWRfXzdS0PkAfakRf
 459Q4SFBC8z+FQjTfn0Oth+UET3pCwjVQMjNtEhLOYAHyyLrEYoFMtSsjntDUmQnZeddiNitMP/
 hQDpLZdFXABlDvdyVLTGUcEBC4chDHo=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa15ff7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1SPZ6byordM7Gp-ApXYA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: bUWE7pAIzmLxkJTso1btlwneumTWtvfo
X-Proofpoint-GUID: bUWE7pAIzmLxkJTso1btlwneumTWtvfo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MCBTYWx0ZWRfX/zzGl08vHIxq
 n4GZwf9Srm9jJpJF9pxaWCSUv27jKSC5Bd9QfFskbXRPPZ4IQmWoL/pikViG4SOdMrLBmLuqJqT
 ou1yNFz66oVkqc32VE3Bv+2omHczNwgs4K3VV4ANaJNsxfZye8//LcnheCRaL9Y6C0ItxQXuKCZ
 8OUo/zFpHXHRgZg09sjfDtbNBh+QhhwPX8YKlJrTn68gmwdzy694l7BQ9WUvxmbDhRDC3/+tMNg
 EzvWLY2cFmy4fr0gNeOHfq24M5BOqjToc0ShWiJo4Z3x0Wn/vTijinzVhR4cirwA5EV/jxn4t6h
 RO8e4RnamW67aIPeiR+j1QbfamfCuGglrANJHBfabyue+bAQIOTlCx5JuUFuhrZFrZgs8qNipY9
 IscudRStiMKXnB46dDA1BRHyx52eo200aF7r/fImDjsHjyeoUGDMaHQuf1TChOvtKiLIkDuvAwB
 D+/RUlo36c3jjiXPWOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090150
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

Hello!

It seems like after the tcg/tests meson infrastructure work we shouldn't
add TCG tests the way we were doing before.

With this series as is, on top of a recent master:

$ make -C build -j 16 check-tcg
(...)
$ grep 'sdext'  /local/mnt/workspace/qemu/build/meson-logs/testlog.txt
$

If I change to the new meson infrastructure:

$ make -C build -j 16 check-tcg
(...)
$ grep  'sdext'  /local/mnt/workspace/qemu/build/meson-logs/testlog.txt
test:         tcg+tcg-riscv64-softmmu - qemu:riscv64-softmmu-test-sdext-sigill
command:      MESON_TEST_ITERATION=1 ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1 MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 MALLOC_PERTURB_=171 RUST_BACKTRACE=1 UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 /usr/bin/env QEMU=/local/mnt/workspace/qemu/build/qemu-system-riscv64 /local/mnt/workspace/qemu/build/qemu-system-riscv64 -cpu rv64,sdtrig=true,sdext=true -M virt -display none -serial stdio 
-semihosting -bios tests/tcg/riscv64-softmmu-test-sdext-sigill.test


We want to run the test with 'check-tcg' (and seems like it also runs with
'check' too) so I'll re-send the patches with the relevant test changes.

Cheers,
Daniel


On 9/7/2026 8:46 AM, Daniel Henrique Barboza wrote:
> Greetings,
> 
> This version is a simple rebase with master, where a trivial conflict
> with tests/tcg/riscv64/Makefile.softmmu-target was solved, and with my
> S-o-Bs on patches 1-6.
> 
> No other changes made.  Patches based on master.
> 
> Changes from v7:
> - Added my S-o-B in patches 1-6
> - Patch 7:
>    - fixed conflict with Makefile.softmmu-target
> - v7 link: https://lore.kernel.org/qemu-devel/20260831141007.353854-1-daniel.barboza@oss.qualcomm.com/
> 
> Chao Liu (6):
>    target/riscv: add sdext debug CSRs state
>    target/riscv: add sdext Debug Mode helpers
>    target/riscv: add dret instruction
>    target/riscv: add sdext enter Debug Mode on ebreak
>    target/riscv: add sdext single-step support
>    target/riscv: add sdtrig trigger action=debug mode
> 
> Daniel Henrique Barboza (1):
>    tests/tcg/riscv64: add sdext "not on Debug mode" sigill tests
> 
>   include/exec/translation-block.h              |   4 +-
>   target/riscv/cpu.c                            |   7 +
>   target/riscv/cpu.h                            |   9 ++
>   target/riscv/cpu_bits.h                       |  33 +++++
>   target/riscv/cpu_cfg_fields.h.inc             |   1 +
>   target/riscv/helper.h                         |   3 +
>   target/riscv/insn32.decode                    |   1 +
>   target/riscv/machine.c                        |  20 +++
>   target/riscv/tcg/cpu_helper.c                 |  91 +++++++++++++
>   target/riscv/tcg/csr.c                        | 126 ++++++++++++++++++
>   target/riscv/tcg/debug.c                      |  59 +++++++-
>   .../tcg/insn_trans/trans_privileged.c.inc     |  24 ++++
>   target/riscv/tcg/op_helper.c                  |  70 ++++++++++
>   target/riscv/tcg/tcg-cpu.c                    |  19 +++
>   target/riscv/tcg/translate.c                  |  15 ++-
>   tests/tcg/riscv64/Makefile.softmmu-target     |   5 +
>   tests/tcg/riscv64/test-sdext-sigill.S         |  83 ++++++++++++
>   17 files changed, 564 insertions(+), 6 deletions(-)
>   create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S
> 



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F00606A32C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYUIqdW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IpdlWZNi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOxgr-0006CM-Sf; Thu, 05 Nov 2026 08:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOxgp-0006Bo-Re
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 08:39:39 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOxgn-0004Hd-Kz
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 08:39:39 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5B3Lp63193515
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 13:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7we1YJqvKG5/1uA1dYSyDRD8oLi92BjG2pcW2Tmejq0=; b=TpYUIqdWtAD5zjRa
 qp8jIf6DHtz8avMbiLyfWD/1TRoBI6/HbWNykOIkOJKDes0T2emhluBGAaC8foN/
 YNf7+S563N3mLa0wzu7z5630ieHG2JlFhsTbawTIqR2J9A5cDIVSGsZSEBEww2AG
 YaDXmA2PNTQXHLqbBrY801EGRFfcHV+sJs4iqwsOnoc7piH/sxAx5/C88dqxfEji
 My6Pw2B7Wwry4VorxbTuNzKyjWrgIgvxVN39Vd6ODBOqUJh8E/HxxI9KflXKA2et
 HWJb59eqfx42KsBNmxLXhDl7DVUjePPkY0scWrO7mz/McERm0KO67GY78VtaBsAV
 a2Fa5A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrnhw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 13:39:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5ec17386b57so1553625e0c.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793885974; x=1794490774; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7we1YJqvKG5/1uA1dYSyDRD8oLi92BjG2pcW2Tmejq0=;
 b=IpdlWZNilQuWN5+PlF+QDgn1BlCzOPiKI+Xdsv3Rum7vupBcw9drWs9HPAdIImrbNi
 BQPAV9lQUu5fj2UvJCjzechv9B0x+E/1cZU6ve4iUj68SHdrdzT1P5MiAiVDMitjSe8i
 cSo33hfXENejE4JN/apu2m0f3sAZFYEh2tdeYb56EqbBAKDokZH8VNtK9t4wcE5uu8/D
 4EjgyzQ6r15VB3GqyGXM63kRKhW2AClrnSAA2JWFaAxq7NPlOqma/7V2onJn7QKwFzui
 2FfD7kLn/xoaEO4eSXkGw4A9LHSDyBCK8diNPSv7AOPYBZ6Hqh8UaL8/d0vG3CRD+M5j
 naTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793885974; x=1794490774;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7we1YJqvKG5/1uA1dYSyDRD8oLi92BjG2pcW2Tmejq0=;
 b=UD+CbFqeZtcuF9eSkPk8ZZUAaxzOOpFT19ynA1EGY6dNc30V0Dex+UHB8LQJfxv1s7
 kr3ufEQy/+yiZIVU5AfBH4l4c4L37d8jSWwc6u9P5bIusJhKAsBdUMW+pZfwlEqRLBj7
 yUbuVVtXvARcGc8mp77S0khr0l4VZ+/UAdURStd/mu9EHXADYbafWVNCJhSdZqjigiik
 tvw/vNJqgtiTqLqidZPZz1n93v8qrciPtmmPU3NmaL1SkHrFjnkiQpzYZGE42o/QTFDw
 CBcUCZsejCF6/tHQnkzUCa59jWzfl7jQf9YNQhf8+c01V5ZZ9T3u2mRAmiRqRuO4qrO4
 5LJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByTwiuzUzwpWvqPuVenm4WjxXepozNwpfw3lblfXlkIkmk8bs7pcQhXNJYy+bj1/EWm4Dm4jMSxgVIb@nongnu.org
X-Gm-Message-State: APuU4Z+z5lRYGiAD3FiTldpvnO1f3ePbqTySq+1s7EqDLT3D3vWFB7TN
 p3G5k/BanywC3puVZ261B5sm/OiCe9J8gTT3QmTW82DGiPy+wlSb83s53SREnemZXvOZ1pR53oT
 OiwUKLEaTzoFx1m6VOhATCDXt3ZDrN9SU8tvN0X8jCiY2kML7LQZApzDEvA==
X-Gm-Gg: AYBFou2BT+OmMBzYXw0/5jB6XA77Rl50e9HQqvKgfoUSs809WSvTLL8k9CSD66+3ed7
 Wj8xByy2mLCfrkpDCbBhPFkW0SB9jXb5N9/U+cmShqgWMNMBvleRsm7BD2pt8KJ0dsRs7qsIxnk
 yhEwf5xa9kpTyaqO2yNtFWtC7++mwAJqQg3NN3YEW2hl5qAPY/RauV+leAQRvntQnpy3uQGyKHj
 v6+2Hj4vDpzTbTtKwrYPLxFqDEbSr5Z9RRTW57lOj1ie0pH3NUH4efFpKGzDYKv7KcYGZlUWX7J
 TVDku0XZYx582BTXsuRMruAWigJbF3Q9UmMbU5s2A7qKiWwoQyIIJNUargw4GdNHDmBtFKEeXgo
 whWyPkZQMDgUaU2w2wrsXLseebNbovloP3L4SKJjUkj3jeZPyArmWBIjQPvg8WwLSxInXNjY0C6
 HBFbHPYTKB
X-Received: by 2002:a05:6122:f89:b0:5ea:d03c:f0cb with SMTP id
 71dfb90a1353d-5ec68293375mr10520789e0c.0.1793885973902; 
 Thu, 05 Nov 2026 05:39:33 -0800 (PST)
X-Received: by 2002:a05:6122:f89:b0:5ea:d03c:f0cb with SMTP id
 71dfb90a1353d-5ec68293375mr10520771e0c.0.1793885973418; 
 Thu, 05 Nov 2026 05:39:33 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.253])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5eca8d9fe6dsm4183537e0c.9.2026.11.05.05.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:39:32 -0800 (PST)
Message-ID: <c40c1116-c1bd-42d3-86fc-c056b0fab558@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:39:29 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/11] target/riscv: Add system test for Smmpt34
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, chao.liu.zevorn@gmail.com,
 liwei1518@gmail.com, qemu-riscv@nongnu.org, rahul@summations.net,
 xiangyi.zeng@linux.alibaba.com, cxx194832@alibaba-inc.com
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
 <20260723200325.24969-12-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200325.24969-12-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec8717 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=LQvE5zGBNe+6ot3hfEwogQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SRrdq9N9AAAA:8 a=FMjj5NILGuuyTn5Zm2EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: __M1ZbpSCtQuoQ5JVINholt5WthJPw27
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX9iwJybgvulaq
 KHjObnpDHXDrjMBBW+x0SGOP1nzONbgAEpnNtUIpW4JxbJcNpI/M0ev37XPvVNHh+SxCM5nheP7
 n8+HXo3sn4lr4QAoo5MQ42jnwkLtvtE=
X-Proofpoint-GUID: __M1ZbpSCtQuoQ5JVINholt5WthJPw27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXyxAjGUtqR4kt
 LXEzSn5ezzL4gpva9WTmGySFVqThlRfdJJiE8sPInO2frP+ANrjJL+ZeIW8nZdXNqVBo+hOjE0d
 i5yZI7XViVJzkIRRiW9eO3+ErVEBaDp2tB6WYeBNGvHXpSPERuZfJjIR9ODS0oc+Jq1csdA3WRb
 CRPI6NpzJJISyqLk7OjaPb9TM+VU3BWXF94fnJVDKfoPudTGzYyxvT1urzSKpJXeh/0XoloKx/D
 vo10KXKg0PpJNnAqJgEs+l8KzYz7PPQGACeba5b2kXab28xGz/OvnJYIMX2LL7d2Q+P+571AjJI
 /pDbN06Rs3HF6mafSbDU7C7Nh+k1P/cPpI1xTIcrjsipcC43dK4VUlSBqC8mkmywb9jkyToRA8g
 3nvv9QklZonmPKbyMyFw88wbpOjsUfqii2iDpiJrgyYrz0nmOg8MMBenqCKtjdxfIcmCgdaIGoI
 NbYXW3zl0P4NYFcc4pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 7/23/2026 5:03 PM, LIU Zhiwei wrote:
> Add SMMPT system-test coverage for Smmpt34, the RV32-only memory
> protection scheme (2-level MPT with 4-byte entries).
> 
> Smmpt34 requires a 32-bit CPU, but qemu-system-riscv64 can run a 32-bit
> CPU (-cpu rv32), so the test lives in tests/tcg/riscv64 alongside the
> RV64 Smmpt tests and shares the same harness (smmpt-common.S). It only
> differs in the table geometry: 4-byte MPTEs, two radix levels, a 10-bit
> level-0 index and the RV32 mmpt CSR layout (MODE in bits[31:30]). It
> exercises the same permission and structural checks as the RV64 tests
> (all XWR encodings for load and store, V=0 and reserved-bit leaves, and
> NAPOT leaves with a valid and a reserved G field), using the same access
> addresses. It is built for RV32 and run on qemu-system-riscv64 with
> -cpu rv32.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tests/tcg/riscv64/test-smmpt34.S | 97 ++++++++++++++++++++++++++++++++

I believe we're missing the meson/Makefile entry for this test.

Since it's a 32-bit test only we want it in the tests/tcg/riscv32/ dir.

Moving the file, and adding the following tests/tcg/riscv32/system/meson.build
entry:


tests += {
   'test-smmpt34.S': {
     'exe_name': 'test-smmpt34',
     'cflags': cflags + ['-march=rv32gcv'],
     'qemu_args': ['-cpu', 'rv32,x-smmpt=true', qemu_args],
   }
}


We'll have the following error:

FAILED: tests/tcg/riscv32-softmmu-test-smmpt34.test
/usr/bin/riscv64-linux-gnu-gcc ../tests/tcg/riscv32/test-smmpt34.S -o tests/tcg/riscv32-softmmu-test-smmpt34.test -static -MMD -MF tests/tcg/riscv32-softmmu-test-smmpt34.d -Wall -Werror -O0 -g -fno-strict-aliasing -fno-stack-protector -march=rv32im_zicsr -mabi=ilp32 -nostdlib -ffreestanding -Wa,--noexecstack -Wl,-T ../tests/tcg/riscv32/system/../semihost.ld -march=rv32gcv
../tests/tcg/riscv32/test-smmpt34.S:43:10: fatal error: smmpt-common.S: No such file or directory
    43 | #include "smmpt-common.S"


To fix that you'll need a tests/tcg/riscv32/smmpt-common.S symlink to the
original tests/tcg/riscv64/smmpt-common.S file.


Doing all that will make the test run successfully with 'make check-tcg'.



Also, for the other riscv64 test files from patches 09 and 10, adding this
entry in tests/tcg/riscv64/system/meson.build will enable all of them:

tests += {
   'test-smmpt.S': {
     'exe_name': 'test-smmpt',
     'cflags': cflags + ['-march=rv64gcv'],
     'qemu_args': ['-cpu', 'rv64,x-smmpt=true', qemu_args],
   },

   'test-smmpt52.S': {
     'exe_name': 'test-smmpt52',
     'cflags': cflags + ['-march=rv64gcv'],
     'qemu_args': ['-cpu', 'rv64,x-smmpt=true', qemu_args],
   },

   'test-smmpt64.S': {
     'exe_name': 'test-smmpt64',
     'cflags': cflags + ['-march=rv64gcv'],
     'qemu_args': ['-cpu', 'rv64,x-smmpt=true', qemu_args],
   }
}




Thanks,
Daniel



>   1 file changed, 97 insertions(+)
>   create mode 100644 tests/tcg/riscv64/test-smmpt34.S
> 
> diff --git a/tests/tcg/riscv64/test-smmpt34.S b/tests/tcg/riscv64/test-smmpt34.S
> new file mode 100644
> index 0000000000..92c8320999
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-smmpt34.S
> @@ -0,0 +1,97 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Test for the Smmpt34 (Supervisor Memory Protection Table) extension,
> + * per SMMTT specification v0.4.9.  Smmpt34 is the RV32-only scheme.
> + *
> + * Although Smmpt34 requires a 32-bit CPU, the program is run on
> + * qemu-system-riscv64 with a 32-bit CPU (-cpu rv32), which lives in the
> + * same target as the RV64 Smmpt tests.  It is therefore kept here in
> + * tests/tcg/riscv64 alongside the other Smmpt tests and shares the same
> + * harness (smmpt-common.S).  Build it for RV32 and run it as:
> + *
> + *   $CC -march=rv32ima_zicsr -mabi=ilp32 -I tests/tcg/riscv64 \
> + *       tests/tcg/riscv64/test-smmpt34.S -Wa,--noexecstack -c -o smmpt34.o
> + *   $LD -m elf32lriscv -T tests/tcg/riscv64/semihost.ld smmpt34.o -o smmpt34
> + *   qemu-system-riscv64 -cpu rv32,x-smmpt=true -M virt -display none \
> + *       -semihosting -device loader,file=smmpt34
> + *
> + * Smmpt34 uses a 2-level MPT with 4-byte entries (8 pages per leaf,
> + * pi = SPA[14:12]).  The supervisor physical address is partitioned as
> + * pn[1] = SPA[33:25] (9-bit root index), pn[0] = SPA[24:15] (10-bit level-0
> + * index) and range offset SPA[14:0].  For the RAM addresses used here
> + * (0x8xxx_xxxx, < 4 GiB) pn[1] resolves to 64.  See smmpt-common.S for the
> + * MPRV trick, the shared address layout and the exit-code convention.
> + *
> + * This test reuses the same shared harness and the same access addresses as
> + * the RV64 tests; only the table geometry (4-byte entries, 2 levels, 10-bit
> + * level-0 index) and the RV32 mmpt layout differ.
> + *
> + * MPT layout (Smmpt34, 2 levels, 4-byte entries):
> + *
> + *   L1 (root) @ 0x8040_0000 : entry[64]  -> non-leaf, PPN(L0)=0x80410
> + *   L0        @ 0x8041_0000 :
> + *     entry[160] -> non-NAPOT leaf (LEAF_ALL_XWR)  covering 0x8050_0000+
> + *     entry[162] -> V=0 (invalid)                  covering 0x8051_0000
> + *     entry[164] -> leaf with a reserved bit set    covering 0x8052_0000
> + *     entry[192] -> NAPOT leaf, G=6, XWR=RW         covering 0x8060_0000
> + *     entry[256] -> NAPOT leaf, reserved G=0        covering 0x8080_0000
> + *
> + *   mmpt = MODE(1=Smmpt34)<<30 | PPN(0x80400)
> + */
> +
> +#include "smmpt-common.S"
> +
> +	.option	norvc
> +
> +	.text
> +	.global	_start
> +_start:
> +	/* Install the M-mode trap handler */
> +	lla	t0, mtrap
> +	csrw	mtvec, t0
> +	csrw	medeleg, zero
> +
> +	/* PMP entry 0: NAPOT covering the whole space, RWX. */
> +	li	t0, -1
> +	csrw	pmpaddr0, t0
> +	li	t0, 0x1f
> +	csrw	pmpcfg0, t0
> +
> +	/* Build the MPT tables (M-mode stores bypass the MPT). */
> +	/* L1[64] = non-leaf -> L0 (PPN 0x80410): (0x80410 << 10) | V */
> +	li	t0, 0x80400000
> +	li	t1, 0x20104001
> +	sw	t1, 0x100(t0)		/* 64 * 4 = 0x100 */
> +
> +	li	t0, 0x80410000
> +	/* L0[160] = non-NAPOT leaf carrying all XWR encodings (pi0..pi7) */
> +	li	t1, LEAF_ALL_XWR
> +	sw	t1, 0x280(t0)		/* 160 * 4 = 0x280 */
> +	/* L0[162] = 0: invalid entry (V=0) */
> +	sw	x0, 0x288(t0)		/* 162 * 4 = 0x288 */
> +	/* L0[164] = leaf with reserved bit 3 set (V|L|rsv|XWR[pi0]=RW) */
> +	li	t1, 0x30B
> +	sw	t1, 0x290(t0)		/* 164 * 4 = 0x290 */
> +	/* L0[192] = NAPOT leaf: V|L|N | XWR=RW(0x300) | G=6(0x6000) */
> +	li	t1, 0x6307
> +	sw	t1, 0x300(t0)		/* 192 * 4 = 0x300 */
> +	/* L0[256] = NAPOT leaf with reserved G=0: V|L|N | XWR=RW | G=0 */
> +	li	t1, 0x307
> +	sw	t1, 0x400(t0)		/* 256 * 4 = 0x400 */
> +
> +	/* Program mmpt: MODE=1 (Smmpt34) at bits[31:30], PPN = 0x80400 */
> +	li	t0, 0x40080400
> +	csrw	0x382, t0		/* CSR_MMPT */
> +
> +	/* mfence.pa must not fault in M-mode */
> +	TEST_MFENCE_PA 1
> +
> +	/* Run the shared permission and structural checks */
> +	RUN_LEAF_CHECKS
> +
> +	/* All tests passed */
> +	li	a0, 0
> +	j	_exit
> +
> +	SMMPT_HARNESS



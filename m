Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A84CC001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 13:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNvnd-0000Cg-AC; Mon, 24 Jul 2023 09:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qNvnT-0000BS-V2
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 09:40:24 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qNvnJ-00027g-SG
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 09:40:23 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a412653335so2606193b6e.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Jul 2023 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690206012; x=1690810812;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAHBHlfbCKRf9a5S9CZ77/h2vpxtbzyPtjlrOs6QMWk=;
 b=Hto0UfzonmnpQ5UN8XfMOeP0mzkwoTBiWIJphd1zKpuhEFGThu0e2ONXwR7WXrsmuy
 jRfxJMqLIuA0rsk9QRZAleGCj14n51b2DGCuMLisH0wIHvlbhh60zgowJwAco3iKiYA/
 NxdaeIKQQePPeKB2EjJRXi2ge90Cn7pAnd+lseqW9erreln47m47A1IOc/wLbyBmJbov
 bckre3aOKUbt9OXVqgROUtFEw10ntJYZYyb5Zki0M18hF5OcftjAsKMPPIFc6r1HVehg
 dTRHWaHE5z6xeetZiwLePA3ubiZs8783uz0ovOuanKfsRRhnyRZjOnpLrkPV6h9uxRm2
 9+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690206012; x=1690810812;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JAHBHlfbCKRf9a5S9CZ77/h2vpxtbzyPtjlrOs6QMWk=;
 b=WyEGmk3R7lWmWlv1hC29VyMRem9yShoOlSchgOPLD6nn1kpbBnmsci/eiYAlulctpb
 1pZnWc1LV2RU8s9vizMBdRJFLgwyWkBVnimkvIW9Np87OPWbDcfF/m2O8hl2gs1qxhTV
 rvCO+7KqIJHEIYJdWBvMytF100R7ZgivDYbJpIS/RTlZD5lPdqTvfR1DWLZgIKHeKe9f
 p+F3sgXcvsbhdnyhxIEm6/pTi+TvLHK3EVf0CEaFbBXzciF/LJpm32/X9rTMUG1EUjUm
 OTVNH7kNy0XlRnrwLSU4mQjcQmzLoG4B8UgVa27ipoeQZV6KiLxetEC0gYXZ2vd5OGcm
 fP9Q==
X-Gm-Message-State: ABy/qLaX3PGi+pDZwtqFMifSIkzO076XPgyIGq4aKBVU5tL+0JMh9kUU
 E0lsiWzFEWbVjU+sQuIqmp3XRg==
X-Google-Smtp-Source: APBJJlGcEMJRifXAAscUTWWpf5TQhwkjzXTuDBFpTX+D97uyv5fr3blmen92e+nZt5P8IVRQOlKvMw==
X-Received: by 2002:a05:6808:dc4:b0:3a5:c4b0:7233 with SMTP id
 g4-20020a0568080dc400b003a5c4b07233mr928735oic.37.1690206012101; 
 Mon, 24 Jul 2023 06:40:12 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-36.dial-up.telesp.net.br.
 [201.69.66.36]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056808139200b003a59c67286bsm3081511oiw.47.2023.07.24.06.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 06:40:11 -0700 (PDT)
Message-ID: <0e54c6c1-2903-7942-eff2-2b8c5e21187e@ventanamicro.com>
Date: Mon, 24 Jul 2023 10:40:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [RFC] risc-v vector (RVV) emulation performance issues
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Jeff Law <jlaw@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

As some of you are already aware the current RVV emulation could be faster.
We have at least one commit (bc0ec52eb2, "target/riscv/vector_helper.c:
skip set tail when vta is zero") that tried to address at least part of the
problem.

Running a simple program like this:

-------

#define SZ 10000000

int main ()
{
   int *a = malloc (SZ * sizeof (int));
   int *b = malloc (SZ * sizeof (int));
   int *c = malloc (SZ * sizeof (int));

   for (int i = 0; i < SZ; i++)
     c[i] = a[i] + b[i];
   return c[SZ - 1];
}

-------

And then compiling it without RVV support will run in 50 milis or so:

$ time ~/work/qemu/build/qemu-riscv64 -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=128 ./foo-novect.out

real	0m0.043s
user	0m0.025s
sys	0m0.018s

Building the same program with RVV support slows it 4-5 times:

$ time ~/work/qemu/build/qemu-riscv64 -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=1024 ./foo.out

real	0m0.196s
user	0m0.177s
sys	0m0.018s

Using the lowest 'vlen' val allowed (128) will slow down things even further, taking it to
~0.260s.


'perf record' shows the following profile on the aforementioned binary:

   23.27%  qemu-riscv64  qemu-riscv64             [.] do_ld4_mmu
   21.11%  qemu-riscv64  qemu-riscv64             [.] vext_ldst_us
   14.05%  qemu-riscv64  qemu-riscv64             [.] cpu_ldl_le_data_ra
   11.51%  qemu-riscv64  qemu-riscv64             [.] cpu_stl_le_data_ra
    8.18%  qemu-riscv64  qemu-riscv64             [.] cpu_mmu_lookup
    8.04%  qemu-riscv64  qemu-riscv64             [.] do_st4_mmu
    2.04%  qemu-riscv64  qemu-riscv64             [.] ste_w
    1.15%  qemu-riscv64  qemu-riscv64             [.] lde_w
    1.02%  qemu-riscv64  [unknown]                [k] 0xffffffffb3001260
    0.90%  qemu-riscv64  qemu-riscv64             [.] cpu_get_tb_cpu_state
    0.64%  qemu-riscv64  qemu-riscv64             [.] tb_lookup
    0.64%  qemu-riscv64  qemu-riscv64             [.] riscv_cpu_mmu_index
    0.39%  qemu-riscv64  qemu-riscv64             [.] object_dynamic_cast_assert


First thing that caught my attention is vext_ldst_us from target/riscv/vector_helper.c:

     /* load bytes from guest memory */
     for (i = env->vstart; i < evl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
     env->vstart = 0;

Given that this is a unit-stride load that access contiguous elements in memory it
seems that this loop could be optimized/removed since it's loading/storing bytes
one by one. I didn't find any TCG op to do that though. I assume that ARM SVE might
have something of the sorts. Richard, care to comment?

The current support we have is good enough for booting a kernel and tests, but things
aggravate fast if one attempts to run a x264 SPEC with it. With a SPEC run we have
other insns appearing as hot but for now it would be good to see if we can optimize
these loads and stores.


Any ideas on how to tackle this? Thanks,


Daniel



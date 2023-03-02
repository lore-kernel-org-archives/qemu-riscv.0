Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXXGp-00016z-NL
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 19:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXGo-00016L-3C
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 19:58:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXGl-0002qR-Qk
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 19:58:05 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso1139249pjr.5
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 16:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677718682;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ItK9SRcOcOvmfpZhMiXw5CKUBGUsAoPtgaP0usgDQlg=;
 b=cKGEDKmtGE+Dv4JaYdYxAFkR/hsdAn0rSwcMsQyRlhv3qUTKmkNKhB4dNLNwxwa6hf
 h7v0SCILfLQJ0qr69vkIWRSRO3Hls337+SGVIwgXWEsrM4TNJN0WwPz9OYdx1ZEgT5Y3
 QxvMv+ltgpYKvcdpmc687xJ4S5X6oyKXn4eKKqNTt9XaVrHjV7b1YXaD2wJExfwldegN
 vRRFjYykyTUWZeAWs3PemO1P1b2i4iMuWsyGn10P6XYF7XOY3hBaPqE3LevRbmOo2U9y
 VKN0UgbdWD3NZMY2/y7OFtS4h7KxUjyK9VS1h3sePPf8OoitvyV3Zhzq3iN/YQdTmXum
 +8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677718682;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItK9SRcOcOvmfpZhMiXw5CKUBGUsAoPtgaP0usgDQlg=;
 b=ncVJMR4gU8TohptldCGqvWs3Po5NSFcPJFVBLGwbteZ7SDUn7TOUH/y4ZDPQ0fyMMm
 mSo8VMJfMcPub70tiJwTLg2Z0JoheLKKyCGB87ovoyFoBwmvsMbaNBl6K2DrVEvvEPT4
 Cef7sgdLTkXuIPikoMn9nrg4cnOF8XeC8v0XydqdcBHZfR7n0ORQvhw5ptGGW3aDC5hc
 pNb6jkLOjU3VaYn8uHm4fHu/LxN+hrVGO056mCTSh5ikZTQKKcA1LEw8YmRfA57zvg7j
 JRMr5yunEWbSMfpE5o5Uno87FBLCaKpjxNFIQrJVQ4c2x8fk6hTSVBw3sk9xj4jPSfGr
 twBQ==
X-Gm-Message-State: AO0yUKUpBhsVHp9K+WvU2oOZwUTYqwo7Zk69XQYf/55n9irgOQf2qRoB
 0suTcCf//ROdRmIESjbtPOB66g==
X-Google-Smtp-Source: AK7set9AVGUNjOnji3tmiXFKIx/ns3MeNZ9VFEYwf29PNyt4+kKyB9TjnyDEuF9P5uQQMjL+LQtG4w==
X-Received: by 2002:a05:6a20:7d99:b0:cd:6f68:98d6 with SMTP id
 v25-20020a056a207d9900b000cd6f6898d6mr11287482pzj.0.1677718681691; 
 Wed, 01 Mar 2023 16:58:01 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 m25-20020aa79019000000b0056be1581126sm8693673pfo.143.2023.03.01.16.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 16:58:01 -0800 (PST)
Date: Wed, 01 Mar 2023 16:58:01 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 16:57:13 PST (-0800)
Subject: Re: [PATCH v2 05/18] target/riscv: gdbstub: Do not generate CSR XML
 if Zicsr is disabled
In-Reply-To: <CAEUhbmVGe3mtG+NXkLJ9yKcQEXUB8dsZiFDW=d1kmRzWR-Mrdg@mail.gmail.com>
CC: zhiwei_liu@linux.alibaba.com, bmeng@tinylab.org, qemu-devel@nongnu.org,
 liweiwei@iscas.ac.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-2a6425f5-15e1-4614-a6ed-69d611fba7f6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 00:58:06 -0000

On Wed, 01 Mar 2023 16:30:52 PST (-0800), Bin Meng wrote:
> On Thu, Mar 2, 2023 at 7:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 01 Mar 2023 01:55:34 PST (-0800), Bin Meng wrote:
>> > On Wed, Mar 1, 2023 at 5:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>> >>
>> >>
>> >> On 2023/2/28 18:40, Bin Meng wrote:
>> >> > There is no need to generate the CSR XML if the Zicsr extension
>> >> > is not enabled.
>> >>
>> >> Should we generate the FPU XML or Vector XML when Zicsr is not enabled?
>> >
>> > Good point. I think we should disable that too.
>>
>> Seems reasonable.  Did you want to do that as part of a v3, or just as a
>> follow-on fix?
>>
>
> I looked at this further.
>
> The FPU / Vector XML is guarded by the " env->misa_ext" check. If
> Zicsr is disabled while F or V extension is off, QEMU will error out
> in riscv_cpu_realize() earlier before the gdbstub init.
>
> So current patch should be fine.

There's a merge conflict that git auto-resolved as

diff --cc target/riscv/csr.c
index a1ecf62305,3a7e0217e2..a2cf3536f0
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@@ -90,10 -53,10 +53,9 @@@ static RISCVException fs(CPURISCVState 
  
  static RISCVException vs(CPURISCVState *env, int csrno)
  {
-     CPUState *cs = env_cpu(env);
-     RISCVCPU *cpu = RISCV_CPU(cs);
+     RISCVCPU *cpu = env_archcpu(env);
  
 -    if (env->misa_ext & RVV ||
 -        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
 +    if (cpu->cfg.ext_zve32f) {
  #if !defined(CONFIG_USER_ONLY)
          if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
              return RISCV_EXCP_ILLEGAL_INST;

which looks correct to me.  It's passing my tests and queued up, but LMK if
something looks wrong.

Thanks!


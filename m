Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D4AC531DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 06:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1seqsh-0007Lq-TN; Fri, 16 Aug 2024 02:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1seqsd-0007FZ-IT
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 02:56:12 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1seqsb-0000Tj-8t
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2024 02:56:11 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7b594936e9bso1168022a12.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2024 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723791367; x=1724396167;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6f/+3JFYzcy3cXgc3BcD+q5ndWVqr+qoQDmW1MWj1OA=;
 b=gz6Q5y/Uq+QFZCW337hbEc7+z/YobNhxJOn4UKGjvuw071G55T38cr048dp8a/13e5
 tydWUMLhMCSPKdxcY9PK4ACvwZAARFqnIbUX/aArCg1eJJbNlnge7jCQ+N2FaCRZ0vII
 QLwcM/i9Cu4aKcdHpeeYHee54GiEBWAlFQNt0yF2WBZdu0fwnjYMrEMOiEnQ5WvGlf67
 t5selWbmEIOT4yqidpvs5gAT+X4xkuI719873bqcelOFrYhE+Ls0GsVqCPNge9tVETc+
 CkAG7sqY06L0141516mu8oMCZ2i99Ll5Tl86bTCFUvqDeW/VY/Q2sOtKeZLXk5az1pP3
 8wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723791367; x=1724396167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6f/+3JFYzcy3cXgc3BcD+q5ndWVqr+qoQDmW1MWj1OA=;
 b=ZLId/5QIMBStY3hpyCWlU1CJbH+SS8V9K8hJ7M3s37Gd3kQtuHX5RpHfk4cFFGuzkR
 8yO9Y5di+yXbw7IW2yResaSZDhrybESlojKCsAbBwc/JMzERjLvmyWs+WotB3U5M14oD
 2iUcs6/1O6SlO960ZIbJjwQKh2IOHm5vge1KV5bfnkOdTp5H3VG7p22pz0XIc3a5Z710
 eStB7rNVBmsc+EMF4ltQXFH4aHlNgS/UNisKstdZiGHUDetWAEQbAvFGTG+mSczwEk4V
 WHhYOIu+a9YJPdbB33iKmTaiE8+Q/tf+8iCvxpe2TDyS/fCxrhsGp6OqtB7fPcSMaN45
 hTeg==
X-Gm-Message-State: AOJu0Yy/ANiafaRtJ7Sc/xEuPmJv+WX1XDcTutg4dZZaQ17RuhReztzr
 vJzeM1Bulhgkj1p/R4egTk5G2J+r4/56iLiY1xzjS+hMVOGEDSkQY8K7H27nE5w=
X-Google-Smtp-Source: AGHT+IHAv9AXl+UhDln7WsF2EVIw2VopKa7wU4OoqWuL3DaPus5nNZqAO35RtfW+w4kJg31T0KIyPw==
X-Received: by 2002:a05:6a21:2d86:b0:1c4:9100:6a1b with SMTP id
 adf61e73a8af0-1c904fca42bmr2205135637.30.1723791367159; 
 Thu, 15 Aug 2024 23:56:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03032b1sm19747595ad.61.2024.08.15.23.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 23:56:06 -0700 (PDT)
Date: Thu, 15 Aug 2024 23:56:03 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
Subject: Re: [PATCH v4 13/16] target/riscv: compressed encodings for sspush
 and sspopchk
Message-ID: <Zr74Axtj/871L5Nj@debug.ba.rivosinc.com>
References: <20240816010711.3055425-1-debug@rivosinc.com>
 <20240816010711.3055425-14-debug@rivosinc.com>
 <794021c3-02f2-4b64-8d1c-a56125e09462@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <794021c3-02f2-4b64-8d1c-a56125e09462@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 16, 2024 at 03:09:10PM +1000, Richard Henderson wrote:
>On 8/16/24 11:07, Deepak Gupta wrote:
>>sspush/sspopchk have compressed encodings carved out of zcmops.
>>compressed sspush is designated as c.mop.1 while compressed sspopchk
>>is designated as c.mop.5.
>>
>>Note that c.sspush x1 exists while c.sspush x5 doesn't. Similarly
>>c.sspopchk x5 exists while c.sspopchk x1 doesn't.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>Co-developed-by: Jim Shu <jim.shu@sifive.com>
>>Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
>>---
>>  target/riscv/insn16.decode                    |  2 ++
>>  target/riscv/insn_trans/trans_rvzicfiss.c.inc | 12 ++++++++++++
>>  2 files changed, 14 insertions(+)
>>
>>diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
>>index 3953bcf82d..3b84a36233 100644
>>--- a/target/riscv/insn16.decode
>>+++ b/target/riscv/insn16.decode
>>@@ -140,6 +140,8 @@ sw                110  ... ... .. ... 00 @cs_w
>>  addi              000 .  .....  ..... 01 @ci
>>  addi              010 .  .....  ..... 01 @c_li
>>  {
>>+  c_sspush        011 0  00001  00000 01 rs2=1 rs1=0 # c.sspush x1 carving out of zcmops
>>+  c_sspopchk      011 0  00101  00000 01 rs1=5 rd=0 # c.sspopchk x5 carving out of zcmops
>>    c_mop_n         011 0 0 n:3 1 00000 01
>>    illegal         011 0  -----  00000 01 # c.addi16sp and c.lui, RES nzimm=0
>>    addi            011 .  00010  ..... 01 @c_addi16sp
>>diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
>>index 05d439c1f6..67f5c7804a 100644
>>--- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
>>+++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
>>@@ -109,3 +109,15 @@ static bool trans_sspush(DisasContext *ctx, arg_sspush *a)
>>  {
>>      return gen_sspush(ctx, a->rs2);
>>  }
>>+
>>+static bool trans_c_sspopchk(DisasContext *ctx, arg_c_sspopchk *a)
>>+{
>>+    assert(a->rs1 == 5);
>>+    return gen_sspopchk(ctx, a->rs1);
>>+}
>>+
>>+static bool trans_c_sspush(DisasContext *ctx, arg_c_sspush *a)
>>+{
>>+    assert(a->rs2 == 1);
>>+    return gen_sspush(ctx, a->rs2);
>>+}
>
>This indirection is pointless.  Have the decoder invoke the proper 
>insn in the first place.  Identically with how we're treating 'addi', 
>for instance.
>

I was getting compilation error. How to reconcile with arugment sets between
insn32.decode and insn16.decode. Earlier I was doing that and didn't need it.
But after removing indirection in arguments and using single use format, type for
structs instruction arguments ends up conflicting and compiler complains.


>
>r~
>


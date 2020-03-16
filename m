Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDiN7-0001ge-67
	for mharc-qemu-riscv@gnu.org; Mon, 16 Mar 2020 01:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDiN3-0001g8-Ue
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDiN2-0004qG-SL
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:33:01 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40731)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDiN2-0004TF-16
 for qemu-riscv@nongnu.org; Mon, 16 Mar 2020 01:33:00 -0400
Received: by mail-pl1-x644.google.com with SMTP id h11so7464341plk.7
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 22:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OMzCIbqnVYXKoEgAV8Pg/I51LVB8LvWcELPTM/QvtMU=;
 b=Iv9PCvIopxBCivTr+0+Da1C6hhJheb2ayfKAIzf6MNM8jjoHB/mxghwqRvq+yQ9oFS
 U+6Q8vbhSjFog+5uk3sjhTgff3MYoW3pwdHH1/nr8JzMPdUctrOZvRH5n9ziYxLiTHJn
 y+XZUqPYPbjcLoXMgiKPndjRdkvhsrxao8JdivWE9WzR+r6RQNv4mUFUTCHRimNpG5dz
 MX4vWofTzIugrPUsYWLr0U8xxFUr2chkdfBeR5Kxv9aByXbtpGeA+g/7URyNZbNjgIyQ
 UUzcdEuEL9Ax13SvQAiG8VGecaXQX5bT2e/EUpd9SoqcqmN9BWFzckc+8HKUlBEgz2bo
 XGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OMzCIbqnVYXKoEgAV8Pg/I51LVB8LvWcELPTM/QvtMU=;
 b=d7GtA0VmfAtTND5mz5gQrQU+H5uyvtnaN0sNEIoXNXCgXh/+tuAGDHx9xtoB/+2fNO
 VgFMJTZRnmrVkBD2yBoym8PLjDxClv5yMmNxBubQ6E+kFvhNzNRTDwjY1lebDz6PJhYv
 7x0PCIE8krpWNruPArH65pwAOKjGm8YTxijXjtnWQ5JANXdviPooBayMFoziVCR1SG+B
 5ktqAlBeTD+TMwjKP2P0iDEnyo7Dorv3gGeUvmxavBDihbLRBIVt3MSvM/sOi9Ku62iv
 WnkgTQIK9fd5z4pfy6bxQY6JLz4VIqUSi1JJQI7lY7Sw6XF+FHP4o47uEKwoyqECksQQ
 vJqA==
X-Gm-Message-State: ANhLgQ2g349YUxIlRhSYn58/3mdaAD6pfvVDZf6brl0/xS7yL9pCn6Bc
 Boc1zI9eN3FXY/uWNIwJyY3DuJkfPBQ=
X-Google-Smtp-Source: ADFU+vuSbqUfxKhYoISZQjUq67bPGMWhvjeM7uZMQyeastX0/4XVUUnyZtld8IlZ9lAUXl7OxC3orQ==
X-Received: by 2002:a17:902:a603:: with SMTP id
 u3mr25483868plq.105.1584336775815; 
 Sun, 15 Mar 2020 22:32:55 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s15sm16443485pfd.164.2020.03.15.22.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 22:32:55 -0700 (PDT)
Subject: Re: [PATCH v5 22/60] target/riscv: vector integer merge and move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-23-zhiwei_liu@c-sky.com>
 <daeefcff-c444-b289-abcf-74301b09cce9@linaro.org>
 <e6a94433-d524-1b5a-81a2-24987fde7de0@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2230e193-e56a-ef3a-0f32-dcae8d0cecdd@linaro.org>
Date: Sun, 15 Mar 2020 22:32:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e6a94433-d524-1b5a-81a2-24987fde7de0@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2020 05:33:03 -0000

On 3/15/20 7:57 PM, LIU Zhiwei wrote:
>> You definitely want to use tcg_gen_gvec_mov (vv), tcg_gen_gvec_dup_i{32,64}
>> (vx) and tcg_gen_gvec_dup{8,16,32,64}i (vi).
> I have a question here.
> 
> Are these GVEC IRs  proper for any vl, or just when vl equals vlmax?
> I see there are some align assert in these GVEC IR.

Only vl_eq_vlmax.  I should have been more precise.
But I expect this boolean to be true quite often.

> 
> Now the code is like
> 
> static bool trans_vmv_v_v(DisasContext *s, arg_r *a)
> {
>     if (vext_check_isa_ill(s, RVV) &&
>         vext_check_reg(s, a->rd, false) &&
>         vext_check_reg(s, a->rs1, false)) {
> 
>         if (s->vl_eq_vlmax) {
>             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
>                              vreg_ofs(s, a->rs1),
>                              MAXSZ(s), MAXSZ(s));
>         } else {
>             uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
>             static gen_helper_gvec_2_ptr * const fns[4] = {
>                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
>                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
>             };
> 
>             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
>                                cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
>         }
>         return true;
>     }
>     return false;
> }
> 
> Is it right?

Yes, that looks fine.


r~


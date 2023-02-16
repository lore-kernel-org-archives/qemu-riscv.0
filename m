Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShJJ-0002in-Om
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pShJC-0002fC-DH
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:40:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pShJ9-0000JF-II
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:40:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id v23so2625275plo.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=pR9UWEtnJXSqG5vElUc93W/1PlpADu/U01tOXVG8IEg=;
 b=8D0z6XeTj/j9YtJAqkKLb5gF/GkQSu8rsWFUII8Q+UUiCohkuhtPlpVG5C7vkG1Zxi
 Ov8V+6J7qVNcY9HDzUIP9MRj/7LNm8SMkLv4FUxDDs7CEmzTbgiBgIEp3dW6RV/uyEEg
 6AQzeEuOx1mmlK1/qFkabevnzErS3gSSgEGku6OWDhQ2c4X+xvoQvLLGRKxWS1qrPERN
 41x4QIqzdU3JfQ3YzITS8qGVf+aKTv4U9fHSo2GxQEIH+0poHtFcWUorzbF7XmDEfx5V
 SEt1fHsAed6qPqsg0fomDRpJot5eVO1MJcRNTaWSG84jQyDlrBBNJSvUi2zLdTrs8uOu
 8TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pR9UWEtnJXSqG5vElUc93W/1PlpADu/U01tOXVG8IEg=;
 b=bhIPCkqrmOIT0zJfy8hiscUA+yMhQUkjj3G4hakG1wt16EsTWz2NNpJjQZfNED1HPe
 UqYPlhg85rHzfQ9XnhqnSy6+GKfyNXTNVgf9YmtOXPys7a4GCO04VyUnYoA6sAE1keCY
 jzcoKSgMcEvYQB9rvUZJ/4Zf6nm2oBMYX4lzQnxEJv3kea5Q9OsDgXm3T/QpRlIvr7lt
 AgAU1GHxv1b6aO5cWxrwzQgTIkwPAzl8jEnQJVTyx7MarU3G4g97GBRj2e+Ct0rzimcf
 vX5qk/UOV/FYogxE/qjsb92G67QsZDB+l3wk+Lgc6HcevGSA2HsLPBcSC55X8FNxaok7
 eRhw==
X-Gm-Message-State: AO0yUKUa3laAXj6N4jx4gHcEevjCC/uvrytn9uIgyhywxqRsWm6bPszd
 rxxHpDlnlLtfeI6wKzZ7onGqjg==
X-Google-Smtp-Source: AK7set/ALb0fve/Chyd/ghjtDe4UjYf+xGznhAmIWbMWj8+70Bjn8NdSb/VXA3HwLF9B28th9cRSSw==
X-Received: by 2002:a17:902:dad1:b0:198:eaac:4643 with SMTP id
 q17-20020a170902dad100b00198eaac4643mr7882106plx.4.1676565629569; 
 Thu, 16 Feb 2023 08:40:29 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902e9c600b0019ac23cb6edsm1511469plk.181.2023.02.16.08.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:40:29 -0800 (PST)
Date: Thu, 16 Feb 2023 08:40:29 -0800 (PST)
X-Google-Original-Date: Thu, 16 Feb 2023 08:28:58 PST (-0800)
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
In-Reply-To: <CAEUhbmX6Qb1aAdZC+d2F=n5qLo60XGiE3e0xTco1TgNgDxAKVg@mail.gmail.com>
CC: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-af7566fe-2c88-460b-8cd4-f52b198bbff4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 16:40:36 -0000

On Tue, 14 Feb 2023 18:22:21 PST (-0800), Bin Meng wrote:
> On Tue, Feb 14, 2023 at 10:59 PM weiwei <liweiwei@iscas.ac.cn> wrote:
>>
>>
>> On 2023/2/14 22:27, Bin Meng wrote:
>> > At present the envcfg CSRs predicate() routines are generic one like
>> > smode(), hmode. The configuration check is done in the read / write
>> > routine. Create a new predicate routine to cover such check, so that
>> > gdbstub can correctly report its existence.
>> >
>> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
>> >
>> > ---
>> >
>> >   target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
>> >   1 file changed, 61 insertions(+), 37 deletions(-)
>> >
>> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> > index 37350b8a6d..284ccc09dd 100644
>> > --- a/target/riscv/csr.c
>> > +++ b/target/riscv/csr.c
>> > @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>> >   }
>> >
>> >   /* Predicates */
>> > -#if !defined(CONFIG_USER_ONLY)
>> > -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>> > -                                       uint64_t bit)
>> > -{
>> > -    bool virt = riscv_cpu_virt_enabled(env);
>> > -    RISCVCPU *cpu = env_archcpu(env);
>> > -
>> > -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
>> > -        return RISCV_EXCP_NONE;
>> > -    }
>> > -
>> > -    if (!(env->mstateen[index] & bit)) {
>> > -        return RISCV_EXCP_ILLEGAL_INST;
>> > -    }
>> > -
>> > -    if (virt) {
>> > -        if (!(env->hstateen[index] & bit)) {
>> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -        }
>> > -
>> > -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
>> > -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> > -        }
>> > -    }
>> > -
>> > -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
>> > -        if (!(env->sstateen[index] & bit)) {
>> > -            return RISCV_EXCP_ILLEGAL_INST;
>> > -        }
>> > -    }
>> > -
>> > -    return RISCV_EXCP_NONE;
>> > -}
>> > -#endif
>> >
>> >   static RISCVException fs(CPURISCVState *env, int csrno)
>> >   {
>> > @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>> >       return umode(env, csrno);
>> >   }
>> >
>> > +static RISCVException envcfg(CPURISCVState *env, int csrno)
>> > +{
>> > +    RISCVCPU *cpu = env_archcpu(env);
>> > +    riscv_csr_predicate_fn predicate;
>> > +
>> > +    if (cpu->cfg.ext_smstateen) {
>> > +        return RISCV_EXCP_ILLEGAL_INST;
>> > +    }
>>
>> This check seems not right here.  Why  ILLEGAL_INST is directly
>> triggered if smstateen is enabled?
>
> This logic was there in the original codes. I was confused when I
> looked at this as well.
>
> Anyway, if it is an issue, it should be a separate patch.

Seems reasonable to me, it's always nice to split up the refactoring types.  So
I queued this up as 4ac6c32224 ("Merge patch series "target/riscv: Various
fixes to gdbstub and CSR access"").

I had to fix up the From address on the patch you re-sent and there was a minor
merge conflict, but otherwise things look sane to me.  I'll hold off on sending
anything for a bit just in case, though.

Thanks!

>
>>
>> It seems that smstateen related check will be done  for
>> senvcfg/henvcfg{h} when smstateen is enabled.
>>
>
> Regards,
> Bin


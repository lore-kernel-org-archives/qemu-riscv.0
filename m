Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88247C282D1
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 06:22:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tq4cz-0007n0-7L; Thu, 06 Mar 2025 01:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tq4cw-0007m8-Dq
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 01:22:39 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tq4cs-0004AL-Ml
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 01:22:38 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22398e09e39so3806805ad.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Mar 2025 22:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741242153; x=1741846953;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UnTVfzkjDFdmGYMUUbYLV3dkLlTUEGcuIcobOT96F9k=;
 b=RQxKmyMbF4mTbfg81iei4uiNP7/cNounJYUE8aNQZ/Jc3H/yY+Dkm9v3paYV53q7Qw
 8sc5z5oyGd6RCihfmEfab90BpOyevFV56uUGYH4p9VlQLt493M5oj+MoN5BkG8DGcxpD
 WN1/VKcX4gPy5dKDw5SKak5iprFJxna1C+udydyG4RivgTKfHerPuCjtuggwIOwc3Hnn
 GI6NQLnh6hxnGQNkg1tJ/lMqKLinOCY/Zj+07KK5SV3jm5oS5NP41hscdvLf1UV08eDV
 Sn4yf5rZc0QsaloX6abH+yY+WMnUOSkmR1tUNT9DmwVYwuWuAk4Gl8eCqQdwuOle7d+1
 gCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741242153; x=1741846953;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnTVfzkjDFdmGYMUUbYLV3dkLlTUEGcuIcobOT96F9k=;
 b=BkXpDsErVGJh6yPmWpm/aX4QGiAydh6SJu74+UeqnCNXRVi29irewuVNmHtzGBm0d/
 VrKkyMO4IcFcO9IKDkzvWfKuZXJLKF1/rc3E1tg0jr2HK0S4p/i6WF7RzeAwg3vLm3uN
 rh+j7BknpLCMow4Bz75YIm0KbQN2KJhVV7stIgSNCqPIiEC99UqEvnnFTfy+cAgqOMXC
 Qoqbk0ZNsV2fkrtHY1vvbG7i77NDiHOjPRLwlUNbPrCfDKObEiI/nvcQEAM2BqLEHSTE
 kby9SvSZzQTKL/Ja88YHGG9UH6I9kCbYYwSSpk/uBpZ6oNYCebddtzeV4afkc1cxtT25
 ga+g==
X-Gm-Message-State: AOJu0YwEiXifPkqT6xxc73dIh3rCOSOE/fJ1dlbUka/orHZhNWXjDZXa
 Pf548MgumPj+uSo6K8Q7b+/6MKTMClRb8q/5NvienjxiPVcPcPTiIPOgwvB6v6E=
X-Gm-Gg: ASbGncuCnIBmxyeHzqlvddBBSAS9Jn2VnhSTEpCmh8cYol1HrUQeklYXEyqu4bJlqTg
 jlDYtNXYEcQdBVL1tnKv/XsujxQq3vpAC15yWlBO5Qqxc73jk+ncaawEWzERGEDl5/oOFcl0gzF
 /rNPkvjWt6Tt8yMf3mv7XSjhyFSyxKhM9mcQFSEwJ8CK/RIgxlVFSZja6xhojTDUopcHYCdiMBy
 af4scdNzSHAOvXkY3BJF5yNOD6yxDoROQX7dDE3lXFwwJNIxdFl9nWvDi7RvC4GjhaLNn/QtF4A
 xx9Ftbf7XLosCfYAGeABMF7yRLS820O3sTtw8mGNt9Za4UCoczo0Zoo=
X-Google-Smtp-Source: AGHT+IENwOdNi3m7HsfZC99151ddBuW3/wLzgwLWuSWEsi6o01jmz9vCB8Z2bfX8tMmY9nBednOmVw==
X-Received: by 2002:a17:902:e54d:b0:223:5c33:56a2 with SMTP id
 d9443c01a7336-223f1ca7c58mr111810165ad.28.1741242152945; 
 Wed, 05 Mar 2025 22:22:32 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109e944csm4472655ad.74.2025.03.05.22.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:22:32 -0800 (PST)
Date: Wed, 5 Mar 2025 22:22:30 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Adam Zabrocki <azabrocki@nvidia.com>
Subject: Re: [PATCH 1/2] target/riscv: fix access permission checks for CSR_SSP
Message-ID: <Z8k/JpXDl63sbAOb@debug.ba.rivosinc.com>
References: <20250218025446.2452254-1-debug@rivosinc.com>
 <CAKmqyKMrod154GEdDFajnBMh0gg2zFGWxXYA0+xF=xW42SgEjg@mail.gmail.com>
 <Z8k8zi3Moy/RxCWr@debug.ba.rivosinc.com>
 <CAKmqyKPYCWEVyd8ygKR+j8u9cTLG2xoG053p7-EDXcd+8qWfUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPYCWEVyd8ygKR+j8u9cTLG2xoG053p7-EDXcd+8qWfUg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Mar 06, 2025 at 04:20:56PM +1000, Alistair Francis wrote:
>On Thu, Mar 6, 2025 at 4:12 PM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Thu, Mar 06, 2025 at 03:20:55PM +1000, Alistair Francis wrote:
>> >On Tue, Feb 18, 2025 at 12:56 PM Deepak Gupta <debug@rivosinc.com> wrote:
>> >>
>> >> Commit:8205bc1 ("target/riscv: introduce ssp and enabling controls for
>> >> zicfiss") introduced CSR_SSP but it mis-interpreted the spec on access
>> >> to CSR_SSP in M-mode. Gated to CSR_SSP is not gated via `xSSE`. But
>> >> rather rules clearly specified in section "2.2.4. Shadow Stack Pointer"
>> >
>> >Do you mean "22.2.1. Shadow Stack Pointer (ssp) CSR access contr" in
>> >the priv spec?
>>
>> No I meant 2.2.4 of zicfiss specification. Section 22.2.1 of priv spec
>> says same.
>
>I meant that it's now just in the priv spec, the zicfiss spec is no
>longer maintained so we should just reference the priv spec

Got it.

>
>Alistair
>
>>
>> >
>> >> of `zicfiss` specification. Thanks to Adam Zabrocki for bringing this
>> >> to attention.
>> >
>> >The thanks should probably be below the line
>>
>> Sure
>>
>> >
>> >>
>> >> Fixes: 8205bc127a83 ("target/riscv: introduce ssp and enabling controls
>> >> for zicfiss"
>> >>
>> >> Reported-by: Adam Zabrocki <azabrocki@nvidia.com>
>> >> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> >
>> >The actual change looks good:
>> >
>> >Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>> >Alistair
>> >
>> >> ---
>> >>  target/riscv/csr.c | 5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>
>> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> >> index afb7544f07..75c661d2a1 100644
>> >> --- a/target/riscv/csr.c
>> >> +++ b/target/riscv/csr.c
>> >> @@ -191,6 +191,11 @@ static RISCVException cfi_ss(CPURISCVState *env, int csrno)
>> >>          return RISCV_EXCP_ILLEGAL_INST;
>> >>      }
>> >>
>> >> +    /* If ext implemented, M-mode always have access to SSP CSR */
>> >> +    if (env->priv == PRV_M) {
>> >> +        return RISCV_EXCP_NONE;
>> >> +    }
>> >> +
>> >>      /* if bcfi not active for current env, access to csr is illegal */
>> >>      if (!cpu_get_bcfien(env)) {
>> >>  #if !defined(CONFIG_USER_ONLY)
>> >> --
>> >> 2.34.1
>> >>
>> >>


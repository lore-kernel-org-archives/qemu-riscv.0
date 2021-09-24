Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTf1S-0008ES-Gi
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 02:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTf1P-0008A2-1s; Fri, 24 Sep 2021 02:49:23 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTf1N-00030T-IK; Fri, 24 Sep 2021 02:49:22 -0400
Received: by mail-il1-x12e.google.com with SMTP id h20so9194228ilj.13;
 Thu, 23 Sep 2021 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Tb6TsJAffyI5zWSBNB75gLf7ncT5JNiQPb4PD/mAhY=;
 b=iClnpCVvzVbpdOFzSzO26YfjyuMcWjhbzX8Mt5Rir3dEtJe9+P4hBlh7oegZ3PjCaw
 RWtLhWWVjkakBOY9GnsVSquRk6d9T8DeZCYJ2fuJ3JxyuXRd7Wq4s+/E5XzAhxYn88FT
 3Y4q4zdj3aj1ws79b2RuSun2yl64Pn1YEIu8fj4xBrRM3VWZx0c04CRFM9rPdxErjX8U
 l2NQPQ76ygCAA/TX+8pxQcRtRkN6zHfzSBqNsDi1ye3cUTcwMeQ8raxH7u+H5YHRa8Bv
 M3uh9tkVldTnA/ocotAeyTpXSXgVtqkl45r1QeUThZpXxH3DB6V4bwPSQFpjfk7xwOrV
 Hi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Tb6TsJAffyI5zWSBNB75gLf7ncT5JNiQPb4PD/mAhY=;
 b=2FPTxONiS7xgmzjqKgfi/hEW2Llq4A4clLHn4kzfnRdxXcRIRh9cxGoYmnitZBD5Ka
 faUq/EDtrriBGfWcdImPmDOQVIB1q720t3N+qOg1FU0BV8Pljrpu+/7GGt68qbwEagHc
 YiX++KJZu8uSmLTWPos8qzDVEDXz1Jr60YMxLm795cqE+GWjL6P+t4/4KH421ULPHOTS
 O8WnX7NC0jmK2TN1fzCktSrHkUXsKWeMwACSTP2WyYhyr4sDmuGknKhZemPSWe4GGGjW
 s+wLgO43R5cWO9w7e1bTvB6fssj75vtLmkEAI5udsMh2UOtpLhMqUfYHlGAMc5DrIJAO
 qc+Q==
X-Gm-Message-State: AOAM531jqpE+JTa7sLeDGTmtuzLaMZhb2sQ/XNBwzmd6soJxxLQ1PjvW
 y1OuIjgf/4/HVUCWcH7aHRFLob8cB6rVbvRLdc8=
X-Google-Smtp-Source: ABdhPJy7p4ZIh8GMqLU761pFXc5/HpsOHxffz8LPQoBquqAEyFI3TlGpf7RzoCKFrVr9sx8q9ou5Cmfyf89n6ZBjL30=
X-Received: by 2002:a05:6e02:1b04:: with SMTP id
 i4mr6834987ilv.221.1632466159980; 
 Thu, 23 Sep 2021 23:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
 <538d9688-0f2f-c406-50a5-d962e3ce2963@linaro.org>
In-Reply-To: <538d9688-0f2f-c406-50a5-d962e3ce2963@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 16:48:53 +1000
Message-ID: <CAKmqyKNDLcp22Jqe=UhE6sG3XEMd2pcW5bfFDYwpwrOL3kb0iA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 24 Sep 2021 06:49:24 -0000

On Wed, Sep 8, 2021 at 4:48 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/8/21 6:54 AM, Alistair Francis wrote:
> > @@ -967,6 +967,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >               write_tval  = true;
> >               tval = env->badaddr;
> >               break;
> > +        case RISCV_EXCP_ILLEGAL_INST:
> > +            if (riscv_feature(env, RISCV_FEATURE_MTVAL_INST)) {
> > +                /*
> > +                 * The stval/mtval register can optionally also be used to
> > +                 * return the faulting instruction bits on an illegal
> > +                 * instruction exception.
> > +                 */
> > +                tval = env->bins;
> > +            }
> > +            break;
>
> I'll note that write_tval should probably be renamed, and/or eliminated, because it looks
> like it's incorrectly unset here.  If you move the adjustment to cause above this switch,
> then you can move the RVH code that needed write_tval into this switch (just the
> HSTATUS_GVA update?).
>
> But... more specific to this case.  Prior to this, was the exception handler allowed to
> assume anything about the contents of stval?  Should the value have been zero?  Would it
> be wrong to write to stval unconditionally?  How does the guest OS know that it can rely
> on stval being set?

As we didn't support writing the illegal instruction stval should be
zero before this patch.

>
> I simply wonder whether it's worthwhile to add the feature and feature test.

Do you just mean have it enabled all the time?

Alistair

>
>
> r~


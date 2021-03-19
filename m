Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNF2I-0004L4-HN
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF2G-0004KJ-D4; Fri, 19 Mar 2021 09:19:28 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF2E-0008DU-W8; Fri, 19 Mar 2021 09:19:28 -0400
Received: by mail-il1-x12a.google.com with SMTP id r8so7974504ilo.8;
 Fri, 19 Mar 2021 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WKjlAKpHxcHOpOcYsJngiyItPLZLWyW9gfxygmHm6V4=;
 b=UEli+BB3DUGUoqlIAortjwgaxoFy6SSWhnaTuqpIB2dO7PBauQtEcTYaYFWSV0jvNu
 BlrcjawDSP9pTahmMxwqRLfB1UQsOctbAZzdCwCZnCMJXSBE3A6FBNBzyN5T7ckbxXe8
 tNBFt5H0+wFz4FtRg1Jq+Xs8wVWbFmwls6YLgL+3y1gnE46p3Ipy8rF4XGUF3ddyz5ES
 wzzRwou4NPEKP5+U+4js8CDPfYtAQObGvTMkAa8MgqNuizs9Yih2CCpMk6nOmzjQkxvr
 k/Gi+yCpF3OMNotnYB44hmfFD6OkIs6xMwtINUbu1Ed1Un9ExLYWYksaXGHRNgU4SONa
 hfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKjlAKpHxcHOpOcYsJngiyItPLZLWyW9gfxygmHm6V4=;
 b=CX6ZsFrYgxE3mrGXH1lC7pUQgG2wBIcVMtxJz1Dr4KnZs6iIa1M7LF0at1ETbhAPbc
 RnXRcTrCmLlqtuk0R8Zli0DV2Zp83nNigUUQMLUzcFruehSTmn6RDb12M8EN/qwcenUi
 GoPBzX1vIwggkhC4zRyebMUkeNUqMB2bZvu9XgvzUiksuDkPEQ5V7xu+dlr+tcnmA6gD
 eH/56oyvwbGyQIBWLQPNg5Y3yd/IetmoqpgMMzdh0tByvHj7mNv3LeeDHGJp4Q0b+h7h
 28O1VSIcjdVbQCgJ5iM6HGmzWHU/Gb6bPqNDWpV6xYLo0XUd6oVfcVjL9H0PRYrZRT55
 iN+A==
X-Gm-Message-State: AOAM5314tlrNx8Fon3Qmf8JDY6ymZG4onx1TbBFljGzVBMQYYBXO8scv
 wOrXQ4NMED3AC7SCiEWGrS/A98n9lFPVfXv2IcI=
X-Google-Smtp-Source: ABdhPJyFXG5DvLmV/7wwCzhig+Je/cq609yBg4B67tq4RplTceVG4E9gcjC5KoI8hUzDXW14uIZJfKApYnNtdOGXBTQ=
X-Received: by 2002:a05:6e02:1748:: with SMTP id
 y8mr2598467ill.131.1616159965573; 
 Fri, 19 Mar 2021 06:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <9c0fa7d4f191d83ac2e70e830d141f4f4105e061.1616002766.git.alistair.francis@wdc.com>
 <db7bdc63-2c9b-40fc-f36c-230d32810970@linaro.org>
In-Reply-To: <db7bdc63-2c9b-40fc-f36c-230d32810970@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:17:37 -0400
Message-ID: <CAKmqyKNRsh5+q2p1jGWqkq920u4YxQVt9uGneqfeOXTpH_pFcw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] target/riscv: Use the RiscVException enum for CSR
 predicates
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:19:28 -0000

On Wed, Mar 17, 2021 at 3:44 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/17/21 11:39 AM, Alistair Francis wrote:
> > @@ -1312,8 +1320,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
> >           return -RISCV_EXCP_ILLEGAL_INST;
> >       }
> >       ret = csr_ops[csrno].predicate(env, csrno);
> > -    if (ret < 0) {
> > -        return ret;
> > +    if (ret > 0) {
> > +        return -ret;
> >       }
>
> I think you want
>
>    if (ret != RISCV_EXCP_NONE) {
>       return -ret;
>    }
>
> here.  But of course this outer interface is still confused until patches 4+5.
>   So perhaps it doesn't matter.

It probably doesn't, but it reduces churn so I have fixed this.

Alistair

>
>
> r~


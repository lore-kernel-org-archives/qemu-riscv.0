Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdtCW-0001LB-9Y
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 07:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdtCU-0001Ho-KI
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 07:59:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdtCS-0004jE-Su
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 07:59:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id p21so2641489wmq.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Oct 2021 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3ZmOKGB/T7A9+hUthh8aPyTUu2ED9LTp7/mK99CcUvo=;
 b=ihTTklx9iRcNPRep0Me7hKbj4AxggcFCOPEbucrNdZgyt7PZFk3Uk2urmR1guoSzQn
 6/LmEZ9dP3KH+3/Dw0peYmXBV8NmJ3/XpS36x2Za5dbWujfx4tjlNnyPWppRQII9qphM
 5zfiRx6UJs6xsleKGMtnr7gp/itpAvgdcpJ6b+GdOFwmiy5QNmRUQ9Q0AzOEYUt7Mq4A
 adkdcSr9CahWsnMVr0ECk59OhRpBrFW0ooKjeGQ3MRtlM7FgINHPxuyla0t9XwC2Qx0U
 3I/28+9SyY48sJnIfyMEr34g7w3bVHXU+GxDUxnMbwSqN3SRphwZsUovnJhPCDdlDsT0
 Wsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3ZmOKGB/T7A9+hUthh8aPyTUu2ED9LTp7/mK99CcUvo=;
 b=G76Pn9srUF/rtVf2mR7PYHGOnaGpgWLr+19X2Xmyl1Mds4clv2grMRJrOYl2Ny7I6r
 +tg8ceo0zL2GtA7InkzRyc4sNb542p7LH3+5kyTLJwiPHKXEjMS6Ql/isESZUiaIURIK
 ZDrGK3xOvDD55fCVwT5ymBJiwHIuLAoQAx31gnfdk/+25moC9/DQsMvM1BlTV7RVZpd5
 URaqkXpurNLL1xHb9LZHs5Av2gY4HbMMH/SfQC2yjI5y8d2w+JGBA0AJaECfG9l90P5P
 W4XQQCYeybGeneq+a2tUxko2xTWhOODoc8oEhyVPZ6i8hCZ6s1LVr2cy8s8iBjUdFd8I
 /H2w==
X-Gm-Message-State: AOAM5309mlKPJfson/r4c/NpOyR1CtrCSobK8b2HeuhWcHJZPTPyHVfS
 qKvYiSvBwW+G1w3jS4AN+CthYA==
X-Google-Smtp-Source: ABdhPJxPIzjX5oynr1nqt7XFkZRxuXO6FGhxIbQ/IR9JlBm3Kr/jPwO+2iJ2ZpMEYxGZBlBbo9Kn2w==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr13489033wmc.19.1634903943090; 
 Fri, 22 Oct 2021 04:59:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g200sm4232580wme.22.2021.10.22.04.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 04:59:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34FA41FF96;
 Fri, 22 Oct 2021 12:59:01 +0100 (BST)
References: <20211021151136.721746-1-ruinland@andestech.com>
 <20211021151136.721746-2-ruinland@andestech.com>
 <00563f20-1867-6a4e-e9ea-a33ff85f058e@linaro.org>
 <YXJ69gaslRMnOSHm@ruinland-x1c>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, ycliang@andestech.com,
 qemu-riscv@nongnu.org, alankao@andestech.com, wangjunqiang@iscas.ac.cn,
 dylan@andestech.com, alistair23@gmail.com, bmeng.cn@gmail.com,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 2/2] Enable custom instruction suport for Andes
 A25 and AX25 CPU model
Date: Fri, 22 Oct 2021 12:52:18 +0100
In-reply-to: <YXJ69gaslRMnOSHm@ruinland-x1c>
Message-ID: <875ytptgmy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 22 Oct 2021 11:59:06 -0000


Ruinland ChuanTzu Tsai <ruinland@andestech.com> writes:

> On Thu, Oct 21, 2021 at 12:17:47PM -0700, Richard Henderson wrote:
>> On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
>> > In this patch, we demonstrate how Andes Performance Extension(c) insn :
>> > bfos and bfoz could be used with Andes CoDense : exec.it.
>> >=20
<snip>
>> > +static int andes_v5_gen_codense_exec_it(CPURISCVState *env, DisasCont=
ext *ctx, arg_execit *a)
>> > +{
>> > +    uint32_t insn;
>> > +    uint32_t imm_ex10 =3D a->imm_codense;
>> > +    target_ulong uitb_val =3D 0;
>> > +    riscv_csrrw(env, 0x800, &uitb_val, 0, 0);
>>=20
>> This won't work -- you can't access env during translation.  So all this
>> faff around passing env through HartState is for naught.
>
> Sorry, please elaborate me a little bit more.

When dealing with translation you need to separate the translation phase
from the execution phase. CPUEnv is the current run time state of the
vCPU so the value that might be stored in it when you do translation
could very well be different when the translation runs (or runs again).

The correct way to deal with this is by the use of translation flags. If
for example the translation is only valid for a particular execution
state you represent that in a translation flag which you compute in
cpu_get_tb_cpu_state. This ensures that the translated block will only
get looked up when you are in that translation state - if it's not you
will generate a new block for the current state. See the section:

 https://qemu.readthedocs.io/en/latest/devel/tcg.html#cpu-state-optimisatio=
ns

of the developer guide.

--=20
Alex Benn=C3=A9e


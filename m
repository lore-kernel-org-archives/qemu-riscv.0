Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRHIR-0007RD-A1
	for mharc-qemu-riscv@gnu.org; Tue, 30 Mar 2021 12:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRHIO-0007R3-FN; Tue, 30 Mar 2021 12:32:49 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRHIJ-0006XG-6u; Tue, 30 Mar 2021 12:32:48 -0400
Received: by mail-il1-x131.google.com with SMTP id c17so14669923ilj.7;
 Tue, 30 Mar 2021 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqWXXFEj5QfEhYzTMz9x1otP2Fo7miKP7Csw2/dpbb8=;
 b=hmbmw7BCoO4IugYMMlZptzGJKlQWT9ZyReLS6YWeygR0JomQldHJHktPb2tT77IkXj
 AxjuSpNCqYeb9JmeG4S9M5bxMuBIQ7wx6wZw12H4NbZhA5tSJne6kuua7tNGwsZ7fjUX
 BAAOry9fEyyjx+fq6xxirqOcTneO/xEuTrQwxyz8Hd/e6RlA+S/XuKpC/lxy1pGHTW1P
 d+ew3SDX5VmS+smKjbpR+/xXeJFYc16PBmWvJ7SIlOjh2XbAGTCZKMkyOqfvEnTdysmB
 pzYTxkgLAa58GoXWvEvgUpAKdgoK4XLNkoOEZwd6rF0CcM5vWJuh4Gs+mMQZiX5xmc/b
 6QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqWXXFEj5QfEhYzTMz9x1otP2Fo7miKP7Csw2/dpbb8=;
 b=FtRf4cZxx3bz9k8m1LhIupwpCBTdR89OrRJvwGMXR+SWO1yQCbdGpda07S7CDmvNMw
 xLXoiAl+wBb0ybBzDjsR0Wx9wlHdK32TMKmsRoxEHXqGgw4W6lm0fQR8U79q8N5g5VP/
 rzUrjb0PsEWZ2dXQ90pxKpMF8zRlyNPSJ3fCOBTfOcXri5/S9ZItVcs/Dm7PYCaJpK6m
 epjhNy8VL3KWr1c5PZyNhRWdxd+PHGsNCeb1gcAU6aJEUvCRYlaiiJqOtIG0csZt/Spb
 4fYNwbxV0WzkRlGAUnW3E6fRSuavr9kPf5nJK5TjQ/1a0HBDqfRecmN69rnAubYJBG67
 E6SQ==
X-Gm-Message-State: AOAM5312sAhwzDtYSL0M2/sXvXjNvdRxE6Zn5vU5swnqf+x3eciJbjMk
 LSdFiV9SWz4vjdQYm3jeWD/c8AAO2B9oS9km2sE=
X-Google-Smtp-Source: ABdhPJxysiHrCVCv4XEw9gK3FGgrBbPvkW47afMRPXtE6fGIBtYAOuAIIVUZR3I9waktaDLOGrP37rzBEVAOVXWmknI=
X-Received: by 2002:a92:c706:: with SMTP id a6mr4476057ilp.177.1617121961643; 
 Tue, 30 Mar 2021 09:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210329034801.22667-1-dylan@andestech.com>
In-Reply-To: <20210329034801.22667-1-dylan@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Mar 2021 12:30:30 -0400
Message-ID: <CAKmqyKN4V5wCr8zLwjzEr5nn5s_xCfR7n-5y9zQGtsRnqddoBg@mail.gmail.com>
Subject: Re: [PATCH V5] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>, x5710999x@gmail.com, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 30 Mar 2021 16:32:49 -0000

On Sun, Mar 28, 2021 at 11:48 PM Dylan Jhong <dylan@andestech.com> wrote:
>
> Use target_ulong to instead of uint64_t on reset vector address
> to adapt on both 32/64 machine.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..4ac901245a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> -static void set_resetvec(CPURISCVState *env, int resetvec)
> +static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
>      env->resetvec = resetvec;
> --
> 2.17.1
>
>


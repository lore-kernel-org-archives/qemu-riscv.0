Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYASl-0008AU-Dz
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYASj-0008A6-VF
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:49:02 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYASi-0001sM-GD
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:49:01 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i5so3725319pla.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nvLWmEt8n5IuIq8qHZwv+q7Me70MwUbcggNL+tWa8Dc=;
 b=CvTRF7qYi4xCkjNg9T7ngDUfGJeErs4pUFOqtUMAzM7DedElFTGCgQTtu5giFFKbkT
 Xini6ii6s4wgMW/MfYaL4+edLKJpGJS9r2Zkl+xjlcCOHPsO6BRccF97Wq3ANGMtY/jV
 Z/hv70hhwYY32ajxt+Ofmee0fLL5thCv90OREOX+cQJBrx9tjKkj9DcS8S1seuqXE4MW
 HEny49/NROj+zd30wq/EVx7Pzy4GCnYRz0G7hbLRljboN7pHYiBX4rCFcWlX4HOVPIti
 +loZ3j/KWA55UqCJLTJ20V8ZdvjPzjg4JJAkI1qaK946DDnboChbfoz3dQtQfu8y3+pq
 uOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nvLWmEt8n5IuIq8qHZwv+q7Me70MwUbcggNL+tWa8Dc=;
 b=LD9h+Ljf3K8z77APyl+MG4ib7gzLNcs7Xt1Ax91COp1ubb+z9DurWXckKm6BTckb+n
 67vdJuWEXCGRtNbFjK07IPm2Rvjay1SM+vQflM2xzalmdIQ2VY0vUKTTMfMg3KCvsl0h
 hIVhtZC08uKDhqCEi47IadWbEmgLAyyn7YH1yn/O7zvCiTjYSGUFQGrTO8z2N5lkugKl
 P23jYf/kAzEsb5hXlnTU4q3Y7zQeuJpFbAHYXnGBr1zF64UEjgF6pgrxFN2aVNeS33UM
 H4EjQHPk5aXxcBwnkp2qqgAxUKQU1wChoQsxbweDHINe4XklfkX62IsZfSjNtqOMBnUe
 rWXA==
X-Gm-Message-State: AO0yUKUk+NemCqjCd0Z+va6FVZEJU46u0TpcdT3Y/iMvxoQnsttnb+oI
 gS/cl0FuLn7VGkzb63Ec2uIJzQFhnixrKe4MblPXXQ==
X-Google-Smtp-Source: AK7set99ScmVJyENc528RTcDX8icxRDdWCbjAT5ne49i8QBbdYUtZn57CIdyh90a5bCtS3UvDAodir2i8zx5lo0Utsw=
X-Received: by 2002:a17:90a:348d:b0:234:a62e:bc10 with SMTP id
 p13-20020a17090a348d00b00234a62ebc10mr1009221pjb.0.1677869339011; Fri, 03 Mar
 2023 10:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-24-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:48:47 +0000
Message-ID: <CAFEAcA8HR6uc8qptqfoQZDBCyLJ45rL-J5290HSQLuKFd-7-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 18:49:02 -0000

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This variable is not used, only allocated and freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


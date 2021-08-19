Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbRk-0007z8-Bc
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbRi-0007uY-HA; Thu, 19 Aug 2021 02:22:34 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbRd-0000sY-Ta; Thu, 19 Aug 2021 02:22:34 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id p4so10293102yba.3;
 Wed, 18 Aug 2021 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HT1DngDNP46mr12cf5bAiolfnsYETH7zE+evwtvJO/g=;
 b=KndqMWH55A6FVJmFacVQwX1z2Z8WHCpTmbuakhVfAlunbrt9XEV4ksw7Cg1wSwPOAm
 f4vwvBA/oBsJTbeKu4EqIcwkwXrZL9PndBiYyel3guCKYziUYn03101Xd6aZ/F3OqFbw
 DA50aTqNExJVpQwGAMVo1o83rXLGbj++DTbR3BjSmUlwW0MUZWxmzV+eHU2l8lcU2Qyn
 NMHIauOLRjsMb+2twglaUQzI26CXlfBBvDwKYklkwrx9LCO/njHZkIlnEczPoiovxwUg
 PfLXdrJN9RTy2GARcfMwHCaEisVqwydjLEWOFzw93VN/SQhe8taUUvc7z6/ohVWQ8r+F
 hIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HT1DngDNP46mr12cf5bAiolfnsYETH7zE+evwtvJO/g=;
 b=e8BFaNGTqiG7M3Y1/zRcmUDsIJhpxC3iONz9bouMQmgUpGqtanwogPVCgDcJqBvx4y
 qaLRJohDPzSmSOQ7mvL/8q+Rr+NGXayAHoU5lNJMnfuEyVqIA6frzl6BvJ4LgPy8Ug7w
 MLhjdWrBhriAK/Y4ejOLu1tVjob21tmPaIfT1CSwdB8NHApZVMbL49yU+5VubjVeK3/4
 Neipy07wv0GIUDT8zXQOAYoHQphBAMhCmxd5L+TLlZd9/Dvx5RRL/3sYnaHRgK4Uesrc
 zjvVaqHE+CyD8Z8QageK+sW0XJuHG5Y8Fj7PdDRRu8ixrFDLEIsTwnHpA0sZv3qVLXeQ
 Xtnw==
X-Gm-Message-State: AOAM5313vToLnDx8OwpjeYYUXULz5yYnji8IRkGmjft0PmhT7aC+H+qH
 h+DoaIr6KXRP4S+8Yys1vTUkE1kQp29uzieQdAg=
X-Google-Smtp-Source: ABdhPJzoV4i1uGOcKvzavCS1P92VQw1zWYkfg45oLWvjAc0TMEeMn3k7wL+Xn888NGk8aznmuFvIzZi4UNkfGGvxnYE=
X-Received: by 2002:a5b:391:: with SMTP id k17mr16900843ybp.152.1629354148520; 
 Wed, 18 Aug 2021 23:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-15-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-15-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 14:22:17 +0800
Message-ID: <CAEUhbmWNNWOvzhcK4ttmajVz6cBisZhVhcwJxYd7hxvHZXbY4A@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] target/riscv: Use {get,
 dest}_gpr for integer load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 19 Aug 2021 06:22:34 -0000

On Wed, Aug 18, 2021 at 5:29 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


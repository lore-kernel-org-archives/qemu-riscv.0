Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLUog-0008Ks-WB
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 15:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLUof-0008GC-DY
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 15:23:01 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLUod-0007IJ-RO
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 15:23:01 -0400
Received: by mail-yb1-xb33.google.com with SMTP id e127so19880543yba.12
 for <qemu-riscv@nongnu.org>; Tue, 09 Aug 2022 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=b4KEeqYKSmz+xSWapb66v/w2P/GZlVo3Rtu3Jexl1aM=;
 b=XPNjer1sUFMPxWKkDgDe/ymMC1EmQd2vVI3gqYIt7KA65Wea/IG3AtD9ZxGCKZ9smJ
 xToMsw0C8YX1+BMAys49eNVW9cBuQ7AsvumT3fkP7pMaMA//Toq3SsdtKHxnZPaGJQdz
 C2vCnDq9n+09g2G/RBT+DkhMFIoJOkJfEoqSB33nGhD9hkLeahP34edpu2n8XkP27rDl
 hQc/rnGhoDClixS6xzX3b5R485wNt2Az7t/ch+tZPvfSIl8eOAC87BfjihI8HMcRFuhc
 UTc+ggDvfDe1rqGe+qInf5a4QnuRCwmhqiYTNjS2iSVrrYtslI2FKBXkxWSrUHi3VuNs
 aP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=b4KEeqYKSmz+xSWapb66v/w2P/GZlVo3Rtu3Jexl1aM=;
 b=RxVqeDbMLMMpn3r4WpZL/8DYQO1XUhoEJP62/JFlI+Bk+K0SkhxFkE6C8gaBlihVSj
 G+02e1dUsDpGYm07qOXnHCnyJ3gG3uprPmrzEZ8sb9ixHtLRQYeMZ0jGFxK8D++8/OXc
 aB/3VUsaUCvIcv/TYPlKNGBOn7NXdMi8Q0XUYOOFOmIg5Rt+ay3YAyJNmql6Wd+ljtDi
 67cZB89eTVyLV3jJrPwOVWQwKuRL3KfFLMJzmFKXed0IEfDXOA0GtmVBGquTrEe3JhWQ
 luHc82dIEv7c6TBwZb4Thki2T6xQB+6HiFpks8BOPpa+62kWI1P/SJ2j6TxiOB6SEJ7/
 A1fg==
X-Gm-Message-State: ACgBeo1/X9sgNRtSnJO9H/rdwBpgAGqPEkfl7HM+f6jjWmNxVE7k+WN/
 3C8Ygt3o/qlmXvEakW0jPpd+Oi98Soz+6FTmG8iJKQ==
X-Google-Smtp-Source: AA6agR54xfxhSJOlVN769FWis+hbjbwzRCgE7htwvYcDSCU5UEtROWUsR88q/JZIROmE04j1f5lXcIv2ETPuFx2SVmM=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr21535510ybq.140.1660072978267; Tue, 09
 Aug 2022 12:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-6-qemu@ben.fluff.org>
 <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
 <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
In-Reply-To: <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 20:22:17 +0100
Message-ID: <CAFEAcA_-4U7NiXi94NeAQ2K1LZ3QEjEhufO==uU0=Mi5GKbOeA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
To: Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 09 Aug 2022 19:23:01 -0000

On Tue, 9 Aug 2022 at 19:48, Ben Dooks <ben@fluff.org> wrote:
>
> On Mon, Aug 01, 2022 at 12:37:33PM +0100, Peter Maydell wrote:
> > On Wed, 27 Jul 2022 at 23:44, Ben Dooks <qemu@ben.fluff.org> wrote:
> > > @@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
> > >
> > >  static void fdt_add_zdma_nodes(VersalVirt *s)
> > >  {
> > > -    const char clocknames[] = "clk_main\0clk_apb";
> > > -    const char compat[] = "xlnx,zynqmp-dma-1.0";
> >
> > This looks suspiciously like a pre-existing bug to me.
> > Alaistair, Edgar -- shouldn't this be a NUL-separated
> > 'compatible' string, rather than a comma-separated one?
>
> I think the compat[] is fine, I should have probably added I also fixed
> up to just call qemu_fdt_setprop_string()

I guess if it's definitely supposed to be one string instead of two that's OK.

-- PMM


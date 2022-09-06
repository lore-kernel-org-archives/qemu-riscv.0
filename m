Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVQ5G-0005P0-EH
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 00:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ5F-0005NS-7P
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 00:21:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ53-0006NV-Hd
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 00:21:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y136so5221545pfb.3
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 21:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=i7u3LfUeWs///DsuQsLDAMlfLOMAWy7Qt4dlAu+r3/8=;
 b=jzpdaL1bAbCYSuC/oedme8SJPJX19BTBqcqdGB82OKD3VIyRnb/ijJH8ClxadHFzeF
 mlg1s/0EsQMKRKU2NFdjZrj1xhb5MVFyyWpiPE5jqjC0/YB6/Yn9JnkeIkz1g8tNsS1Q
 9kf15x/2CxwPhW9Zm7LwBE0ttHde8B1RtXIJtUTRZg5lWNSHarsjdiyqpZ6pZjPzE3ED
 SG9tJ+fcoRovMoyCaf2X4bYABJG3oYkGfkcMqAnaPyrFJ3q3oDVD3MfGuMeL8o4AThTB
 yy9PhZlS5MGwT2X1+tSu1481WyfsoYc9GDXySOaKgnQRgV73CvBXa1XeTjq4Tl+6aL6m
 f5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i7u3LfUeWs///DsuQsLDAMlfLOMAWy7Qt4dlAu+r3/8=;
 b=tFImdG6TY8tmqQeQHkXzwZy8a0rB+EMrKs+K7VCMUpFigOU1ONP+E5PZaARn+WYojD
 rCIz7MSQ8aNOuHhvtmIG6WYUAB8hDlkwUU/u6cep/LL748eL/6rZaNvNTg+VwdsEiZ4i
 gj8TQyULG52sQlBtWJXwAQaLiCElee3F5y3cWMSNecdFMMCd/9NaM98hHoFRrNTnV0Ub
 O5H5uUS5bCTT1IYXsCcpsrqRYX3+18uiSSM80B1NUF/Y2czPyX1BI2vl5/W1xjd1vpvX
 9EAwKHvIIxdQAFIubXa9GYBKkwWQM6snm9AWtp7Y5sADtx6UM9jleG9Lq95SCvt+k+8S
 d6sg==
X-Gm-Message-State: ACgBeo2W1ndr+sV5WVd47wtyRoqWG3BhXp4IkOxylEalLifrVAIwaGOC
 YorZd8ie4XEJtEMMnFNIvtAMQQ==
X-Google-Smtp-Source: AA6agR5uvin2hKf+OclRhuBbxytWNSWRPEMDIvHusFJLJgj2g6l0VOZzW4x3Uczs/yAUYYV1PxaBSA==
X-Received: by 2002:a05:6a00:1826:b0:537:b261:3e4d with SMTP id
 y38-20020a056a00182600b00537b2613e4dmr54278086pfa.65.1662438055909; 
 Mon, 05 Sep 2022 21:20:55 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 o125-20020a62cd83000000b005371c5859d6sm8749652pfg.60.2022.09.05.21.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:20:55 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:50:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V2 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <20220906042047.GB194675@sunil-laptop>
References: <20220905182238.374545-1-sunilvl@ventanamicro.com>
 <20220905182238.374545-2-sunilvl@ventanamicro.com>
 <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QKs7foPWyf_OgEQog=zhfPNnz5dyevDXjPSXrVkh9sw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 04:21:09 -0000

On Mon, Sep 05, 2022 at 10:20:40PM +0100, Peter Maydell wrote:
> On Mon, 5 Sept 2022 at 19:23, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> > function will be required by riscv too. So, it's time to refactor and
> > move this function to a common path.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  hw/arm/boot.c             | 49 ---------------------------------------
> >  hw/loongarch/virt.c       | 33 --------------------------
> >  hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
> >  include/hw/nvram/fw_cfg.h |  3 +++
> >  4 files changed, 52 insertions(+), 82 deletions(-)
> 
> 
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index d605f3f45a..3f68dae5d2 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -41,6 +41,7 @@
> >  #include "qapi/error.h"
> >  #include "hw/acpi/aml-build.h"
> >  #include "hw/pci/pci_bus.h"
> > +#include "hw/loader.h"
> >
> >  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> >
> > @@ -1221,6 +1222,54 @@ FWCfgState *fw_cfg_find(void)
> >      return FW_CFG(object_resolve_path_type("", TYPE_FW_CFG, NULL));
> >  }
> >
> > +/**
> > + * load_image_to_fw_cfg() - Load an image file into an fw_cfg entry identified
> > + *                          by key.
> 
> For functions declared in public header files, put the doc comment
> in the .h file, not the .c file, please.

Thanks! Peter. Will send V3 with this change.

Thanks
Sunil
> 
> thanks
> -- PMM


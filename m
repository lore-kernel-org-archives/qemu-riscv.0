Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPCP-0006MJ-R9
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1poMO5-0001PK-C0
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 06:47:09 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrea@rivosinc.com>)
 id 1poMO3-0003Wy-ES
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 06:47:09 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dx24so18858006ejb.11
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681728424; x=1684320424; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VfqtPPbHfVBdrdAhnqREqnTDdPl97W9flXB+tn1lhDo=;
 b=QzbzQfBntgLGdksT1bTh55j4U8qkGUybkuAu/UrWCVUbSk88iMery/MNG74MDzFoL/
 egNjj+O8SlUy3Fp402x68kCwDNR5X9b1oTrrRKWuB+965Ilb0truvteg/ndsClQ+Rqh5
 mUtCJj+yUbaIDjSbccSD6Bz6C8+hPYNrBSVgL78v+Tcufs7vv013UQV3gNMq0ilmFHru
 gUNLMCDYFm/dUT9HxRBJ37XmFG0ralEq3tG9/FuvvJ0e39hfUhQggznd/aMiRLygZ1gm
 kUtDKTkaVtmYM8urj+EVOj4/rWeWo+Gw8OUystH8oeX5DXg5NDVDe0a8hU2JGrAPJoeD
 hDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681728424; x=1684320424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfqtPPbHfVBdrdAhnqREqnTDdPl97W9flXB+tn1lhDo=;
 b=YTwpH0AhkNQCjTMIK7/6NE1E8j4nXjay+L1a6jncpbJKjyVNpgh75eLs1fPzF2HoqI
 61F/jLqYSv35VAMJ1G4XhU21NQac2t/jlOspGjQp76s5iJTpIVdk/BqlHG9gwIQT6APp
 oS6HZ6KQ8c2bz2z+wxLWYKE25oXrSI1lJTOJNSxeo4TmgUVg5qDMLSPVnvZIO1vHM2xX
 9oXvcLXjkfpb/etT5/LWF7Of/FckVOoMcWKy91eMziwgBAHvKetohz2D8EH5F3n3d98N
 PmiCvA2TO1xdM/Gicf7x97kMpb3rOcffQypmPLG24FKdHnWwiASNeclYCMZGKlg9XZoG
 oysg==
X-Gm-Message-State: AAQBX9eUirDztECMnCUwOPXjinzfZNYSuUn3xySUC31xMG/zQoXF52bi
 PwlS+rFa4O6RthMdO2dc15qMvg==
X-Google-Smtp-Source: AKy350bfObOkDdzWueZ9G0nIzcjeCl3Hr8sM6sWK8gtcTyq5rXv9mYtMjI6oIWNtp8WxMkcep4BRmg==
X-Received: by 2002:a17:907:8e88:b0:94a:9ae2:1642 with SMTP id
 tx8-20020a1709078e8800b0094a9ae21642mr8580312ejc.46.1681728424200; 
 Mon, 17 Apr 2023 03:47:04 -0700 (PDT)
Received: from andrea (host-87-20-69-111.retail.telecomitalia.it.
 [87.20.69.111]) by smtp.gmail.com with ESMTPSA id
 w18-20020a1709064a1200b0094e92b50076sm6405533eju.133.2023.04.17.03.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:47:03 -0700 (PDT)
Date: Mon, 17 Apr 2023 12:46:58 +0200
From: Andrea Parri <andrea@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] riscv: Raise an exception if pte reserved bits are not
 cleared
Message-ID: <ZD0jos2r4uZocw/5@andrea>
References: <20230412091716.126601-1-alexghiti@rivosinc.com>
 <CAKmqyKNkyakGCFG0DqX02GpqhAPEq=tkt-EVctas5m2XjRuXJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKNkyakGCFG0DqX02GpqhAPEq=tkt-EVctas5m2XjRuXJg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=andrea@rivosinc.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Apr 2023 09:47:17 -0400
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
X-List-Received-Date: Mon, 17 Apr 2023 10:47:09 -0000

Hi Alistair,

> > @@ -936,6 +936,11 @@ restart:
> >              return TRANSLATE_FAIL;
> >          }
> >
> > +        /* PTE reserved bits must be cleared otherwise an exception is raised */
> > +        if (riscv_cpu_mxl(env) == MXL_RV64 && (pte & PTE_RESERVED)) {
> > +            return TRANSLATE_FAIL;
> > +        }
> 
> Isn't this caught by our existing check?
> 
>             if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
>                 return TRANSLATE_FAIL;
>             }

Thanks for checking this out.  AFAICS, the existing check/code doesn't
work if either svnapot or svpbmt are active.

Please let me know if you need other information.

  Andrea


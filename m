Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njgwR-0000OF-4n
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 08:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgwM-0000LR-Hp
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 08:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgwL-0005Bi-0S
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 08:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651063120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QG+qohUvS7YLCeQHAp2tUYRscx38gji7GNbYFZLiXOc=;
 b=Tt7Jx0YydICz/j/eyWokGcW9PcM6FELHU5PCcXR1Lh4zzUIGcUX6FGT7ihDTjB5HF6io/B
 EkLjNEPCaSaC50/FVeQzsrpxhwglUhB8o+l6IDrsMj6v0Sh3ancauakePKMuzMLia9n+S5
 Gxl5XGIk8gYR0mvvivq4TyNwRTtaE2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-I511OYMFNy-qF623LIDrBw-1; Wed, 27 Apr 2022 08:38:39 -0400
X-MC-Unique: I511OYMFNy-qF623LIDrBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso2775108wmh.2
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 05:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QG+qohUvS7YLCeQHAp2tUYRscx38gji7GNbYFZLiXOc=;
 b=JV8HuHlHxpWXmcrEa+0O7bE2/wOhs0SZBPgrTdeTB2NkncSLLuMejEu4Akr8ymISyC
 jkhIjc0Vxqr7FuCc5qx6hjwehi7hGU0hcfuaGIqO3vLuuFw+bvwFm3PLUukS9ZHE5rIJ
 MzXQiW2E4YBxQ58FXr/nj2D1ytTT3Ha9qBK6JtJE1pXn4p8vhErExX2gFIP4B36zxOve
 ZoKE32u4mokZIej2RYabDC1JzP7XqOdFYxC10WBCiXoEA6i3vGlFv9v6OHH+sf04NW9q
 QPx0FNDBu7pYxCsM+2BRnNhgCNnapMXWWUVqIC22785I1LlMbOG91PNc9HKvClG1Fee3
 enzQ==
X-Gm-Message-State: AOAM530tY2DvbEYN0sBffNPS2tivAguo271h7a0b3PB1+oHL7PDIx6Ok
 upb0iEoEJyF5N4XpgOoJLNjIYrkGfVYn97Urgn1Dp9qPQa8hKptAkKbFLn9uNd7FbEt7hDRI+3F
 MY/3nlwPF70f8dqU=
X-Received: by 2002:a7b:c10d:0:b0:393:fbff:24a9 with SMTP id
 w13-20020a7bc10d000000b00393fbff24a9mr5496855wmi.53.1651063117909; 
 Wed, 27 Apr 2022 05:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIAo6Q4yPWLj5cLSWAsrcYVaH9x1mGQotcQbUePmyFIEoNbXC2/jRBYv0hPYIq7g1V0aPjuw==
X-Received: by 2002:a7b:c10d:0:b0:393:fbff:24a9 with SMTP id
 w13-20020a7bc10d000000b00393fbff24a9mr5496837wmi.53.1651063117671; 
 Wed, 27 Apr 2022 05:38:37 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b00392910b276esm1498748wmq.9.2022.04.27.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 05:38:37 -0700 (PDT)
Date: Wed, 27 Apr 2022 13:38:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 1/5] hw/intc: Move mtimer/mtimecmp to aclint
Message-ID: <Ymk5SyRKTh49d+9U@work-vm>
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-2-atishp@rivosinc.com>
 <00335dce-3ca6-b037-be91-4dc3396d6cd0@linaro.org>
 <CAHBxVyFKkXGhyvv0RVCmGs81-Ai7vd8Ri66svLzP3D1u+1D4Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyFKkXGhyvv0RVCmGs81-Ai7vd8Ri66svLzP3D1u+1D4Nw@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Apr 2022 12:38:44 -0000

* Atish Kumar Patra (atishp@rivosinc.com) wrote:
> On Tue, Apr 26, 2022 at 5:50 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 4/26/22 16:08, Atish Patra wrote:
> > > @@ -334,7 +334,6 @@ const VMStateDescription vmstate_riscv_cpu = {
> > >           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> > >           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > >           VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > > -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> > >
> >
> > Must bump version_id and minimum_version_id.
> >
> 
> Yeah. Fixed that. Thanks.

When you start getting stable machine type versions it'll become harder
and you might have to put dummy entries in to keep compatibility.

Dave

> > r~
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



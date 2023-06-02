Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3940AC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q56Mv-0002bw-HJ; Fri, 02 Jun 2023 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q56Ms-0002b7-G0
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 11:07:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q56Mq-0000Kd-Qz
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 11:07:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so22247615e9.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685718423; x=1688310423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IMaMp++maEh23UbeojTuH8euDRvLdifTf4btalguTvo=;
 b=WW+GqF4bHg2hnHsQoU58rP9jpweXNOIIfgys1bXZa6QnMQ3aV3jjC1rCHcbZWIMMQg
 GEx0f1/7w4wtXSyPdKLjlCy1zoxnOKfhBYJJRilc4M78XxZ+6crFRCVYtrK3s8a0jXC0
 H7iMRizE1fBsOJWgaXbPpqYy9iUCgpSgiqwYfnSw5rbcdwgRg3bbcZSt9mz1P/q1Yism
 idrLq46MmVFb8anQi3P4w9V5DuTp9D8lxq9wy+R8hj90F47u/2R6sM3SbI9jyeDRU12+
 XJQ1ojDfzjSxrhReyU+TN+DvI88AahG++BBEykcjwDu1WTXV8YxBuV+qUSuRhj0wIT17
 dBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685718423; x=1688310423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMaMp++maEh23UbeojTuH8euDRvLdifTf4btalguTvo=;
 b=dQZ1ZsuIEosOqu4w9w81SNl4TutG3SQlG4EskgTx6fbP4odhtT8ku4btUKO849lrG7
 Rd4xYypGbD1bEghXZgbSHGjB0oBTtJtfiBR+MyVr3cQqAvINCIn4ZUpYrhkV0jNO5g4J
 WadA3qaDqgEHrXslfnHGxxUvXaUecwEu9op4378Rsn2laZL88QKvwgKV02OigAQZpsoz
 PLy0MTA6bsHjayvmKp//dwSjPRzNiRgzN/2CvgccOll6Lh6rLwQ//OsuZAm9BXOF0j8F
 12AulwCd0Tl1e6DcrfN3VAAeva7dOgPGbCNchzJJIwc1FDCTc1IYcyP2dMQOZVPTPYPq
 V1RQ==
X-Gm-Message-State: AC+VfDwmmDDirTw5ce8UkV3lPcxTEBZf19hvGrkJGTisWfDlCQnGx2Fo
 tD0pDkBgPMTrV19CFX55wtraQg==
X-Google-Smtp-Source: ACHHUZ5U/Cp+3Phi6Cx/4GMaobFvZB0D+uYbEgJC47z3wcYjg2HZb3LRMgxdUwXRU1EyKlzZSnw5IA==
X-Received: by 2002:a7b:c847:0:b0:3f4:21ff:b91f with SMTP id
 c7-20020a7bc847000000b003f421ffb91fmr1962302wml.28.1685718422638; 
 Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003f4247fbb5fsm5801487wmc.10.2023.06.02.08.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:07:02 -0700 (PDT)
Date: Fri, 2 Jun 2023 17:07:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org, 
 richard.henderson@linaro.org
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
Message-ID: <20230602-6e13ca96e3e8064c96abf9bf@orel>
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
 <20230602-86a3d8d9fad1fb3464d28702@orel>
 <024ee92f725f4ffd2952f472861ba9b415f4cde3.camel@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <024ee92f725f4ffd2952f472861ba9b415f4cde3.camel@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 02, 2023 at 04:39:20PM +0200, Robbin Ehn wrote:
> On Fri, 2023-06-02 at 16:02 +0200, Andrew Jones wrote:
> > On Fri, Jun 02, 2023 at 11:41:11AM +0200, Robbin Ehn wrote:
...
> > > +#if defined(TARGET_RISCV)
> > > +    case TARGET_NR_riscv_hwprobe:
> > > +        {
> > 
> > The { goes under the c of case, which will shift all the below four spaces
> > left as well.
> 
> This was an attempt to blend in, i.e. same style as the preceding case.
> I'll change, thanks.

Hmm, I see. This function does have many cases with the indented format,
but not all of them, and the rest of the code base doesn't indent. I won't
insist on changing this, as long as checkpatch isn't complaining.

Thanks,
drew


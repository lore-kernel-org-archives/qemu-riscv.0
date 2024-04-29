Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CF7C19F53
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 14:54:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1SOT-0001ZD-2k; Mon, 29 Apr 2024 10:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1s1SOQ-0001YT-Ql
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 10:54:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1s1SOO-00085b-Tc
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 10:54:10 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6ee12766586so3415152b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1714402446; x=1715007246;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=F1RyZECO+U5v2UI0E3MjiPKlY7GEuVxMkQn/MrwB5ls=;
 b=mWFnoKuvw+tgq4lxDhrlJegYDHnAlz5PyT1qmX/He3KMODpFWInZSVNw4krVdl4fv/
 16kXyA24iQLOSb2ohmGorP5csENMeCcaejKLct/D5HDrPTkRCkVl3HXfu0n9XWLT3wVR
 zJrOZICHFGtbPW4j753m2nExY5QPa2slrt6F5M15UyKJ+0sRLze9n7JZjENTbjMb0Vnx
 s210uIT0k4OjjhTdKrHtUNKC1Tk4jwDeCF7+Oqt1fVYmYZw9yyE8qlhClkK90r1Bma+B
 Z3OC8B5vH08mNFVzqLZ67Q/OMerwOiCTKQnLPcLJYOIiQPHb+nlkSMIjfpmeoRz9q5gl
 cHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714402446; x=1715007246;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1RyZECO+U5v2UI0E3MjiPKlY7GEuVxMkQn/MrwB5ls=;
 b=od7EOR89m32s32+H0LdfVhRIFYhMT16t4pJahg/2aBItvOaW/LBNlufO67mK4QUnDI
 fX5MuzNIUjhAIAyezNNhqHqTnyvLz6ILuBnYnZLWW+VIm6ootFrjMt9fxqgxUdnQncWD
 lTs8W4sDd6N/g2l3LEor4XKaIygpMtCsafBGiSb2+8iLjvYrJow9DVhcW6+4f9viJtRL
 xqmaS6aMOG9b5D5N/fJbx4n3XajAD4z/v8OT0oM1yHoLzXywcg35ZNcc35bPwSkR1Pup
 YwqymXza7VmTQlifKZ6dH8ldmytXrO47geLxcFlwgq9PB77ROIpC+vi4s6rLtslmFcI3
 TtxA==
X-Gm-Message-State: AOJu0YwTDl2Esuq9GS/09LTjCQh5VJLl4sqNm2AuJ8BHSM/5twC9CmVs
 9uneuUvoux3qJdUHy29xm7rePyQ7MgVql3Y32nS+fZ/Bew4pFHrhHt5zAMlUcIBnxQ2Ih1VPNtb
 H
X-Google-Smtp-Source: AGHT+IEbUO3E39mcAr2uW9DO7nQeiRX3reAFi7F7IOVMyVOvXh93pQd74Aef8i6guln1MwyUb6AGkw==
X-Received: by 2002:a05:6a00:4b04:b0:6f3:ee23:3c39 with SMTP id
 kq4-20020a056a004b0400b006f3ee233c39mr9253692pfb.7.1714402445647; 
 Mon, 29 Apr 2024 07:54:05 -0700 (PDT)
Received: from localhost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 fe8-20020a056a002f0800b006ed00ea504asm19395596pfb.159.2024.04.29.07.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 07:54:05 -0700 (PDT)
Date: Mon, 29 Apr 2024 07:54:05 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Apr 2024 07:54:00 PDT (-0700)
Subject: Re: RISC-V Floating Point Extension
In-Reply-To: <ximss-278650015@mail1.uni-kl.de>
CC: qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dchrist@rptu.de
Message-ID: <mhng-c7940df3-4bfa-44cc-b0b4-14c365ed56a9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 29 Apr 2024 07:02:59 PDT (-0700), dchrist@rptu.de wrote:
> Hello,
>
> I'm currently trying to run a RISC-V bare-metal kernel on QEMU that uses the
> floating point extension F.
> It seems like this extension, besides D, is enabled automatically in QEMU.
> In fact, the floating point registers can be examined successfully using
> GDB.
> However, when the first floating point instruction is reached in the program
> execution (in this case flw), an illegal instruction trap is raised. The
> kernel itself is compiled using these flags: -march=rv32imaf -mabi=ilp32f
> Is there something I am missing? Perhaps, the FPU needs to be enabled in
> some way?

There's dynamic enable bits for floating point in the various status 
registers, see mstatus.FS in the priv spec for the details.

> Thanks for your help!
>
> Best
> Derek


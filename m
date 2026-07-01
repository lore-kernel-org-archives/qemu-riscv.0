Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE23C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 05:31:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wenXk-0007Lz-U9; Wed, 01 Jul 2026 01:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wenXb-0007La-Ex
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 01:31:19 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wenXZ-00021f-O2
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 01:31:19 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-664db84f074so235504d50.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 22:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782883876; cv=none;
 d=google.com; s=arc-20260327;
 b=QodBRRgczCMR3ORs9cIwEjTswGyN1pANAOIfupQUqq1QN/wnn1dOdEQBrPdjfaF7fJ
 9BmXokSQJxcLRFEAdPbaXI5TNTCP92S5njbUKD4prBWLi9AZ0AfT5Vtlkw/Sexhs8vxJ
 0M3ZB3c/lj88UEYd3O+Oik6ZFTWAcnUbd39354i3DTFtQpAJuoump9oF/ZCDfUyrzWO4
 K0giIHNTAo1n9MwBS0DcXkRWwz5w2O2eEN6TYyH82oRDRNrMsg0NWu0cO8BbMLpJFRCA
 uSJU10l7MSmpOVuLOZkRJQHH+nAuYE7StcLqsjX+PkizFnVNosfaowQs7K5sh4zEnQOu
 xSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qumB1HQNK54XV6pA63sNU72BNvN5vUyyyUMtH71WTp0=;
 fh=YuYcng6BozoX9A0dRb4TZmhVlF4NlxZ/MCeHszzjNsg=;
 b=SC4+G16fydU5d+f0wLB+a3N5vSH58pWxDCeuJpvXR/mMPo0HVqX24AXbyQkYGB9mxk
 BuisdjZpUIujBUibjduofXVyy8i5YrM/p2zkYbEd6k+se7dEqGFXsiTMnZ8QIxPKxZ7M
 6cQfq+qeqT+TpKYrwDW6QncKksEMooSrZ3Jb+fKEcREOIKhC6V95iLHbk9umVzKjNS8m
 X7Z9E1/cQeTRzpbgUO/T9M6zl/ukrNgNu04EfYCwWSlPr0XajVMI9pErCj0fGW34sHk8
 7B5YLYFaPHsZMQYcs0gIkrrAYZI7cJGwmpMEW2l/fsFE17cl5JQE+LQoAtr1LD0Vi3Bv
 Q5mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782883876; x=1783488676; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qumB1HQNK54XV6pA63sNU72BNvN5vUyyyUMtH71WTp0=;
 b=NJ8QYcf/y5o1RkE/jCs6L6aJiLOnAq8Lkw2yOts7hSpBW5skuawVvCDAW1YPdTlUvD
 ZrXcwZX60r7tqXuIt70FqicPL+5iFenT43fd4JqYoZdnfCkHG1rqJMbo8sukXbo6nVN0
 oj/tGIk6gr7c3w3WtSI/ibBdhPB3hgPTlQmfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782883876; x=1783488676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qumB1HQNK54XV6pA63sNU72BNvN5vUyyyUMtH71WTp0=;
 b=BHIKks3Yw4W3VT0UCz+nefeR0bQMp1eLxj2aVXXnLIa00DRrz8XUAUJNNSXQoYJezR
 jS0Uw94Ek7YX8nB97QuJvNyPURZiEr+vILHrRo6eoaYKa0MZub8bkqGe2F9Tm1N6qwG8
 oCvNcaLNVfRMdDDOA5O0e25puYC7d629m5eHcLmqwiHEGTwkiheC2J6ks2vXQwRVMSy9
 7GjeicflQpwxwsQgZ2oIvhJuUOc6IOXecMCd0v6/czq749ArY9DS0loE6N7ODUvPxXrH
 bVcCikuuNzJjVoKPRxOWdjvpsOJcXdA79imDejlVYw/1qPsyYjiqW4JYbwKSUViNou4W
 58fA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXvDeZCvJinyVR1ujbJTOh8d/GJIapUNPGUd8vJTy5jfeHxyJEFbH4OIWnZCXTtQhxWUHSzB5oo0SX@nongnu.org
X-Gm-Message-State: AOJu0YwhLhFLEOdEW/IiDbQLVJZz3hM9BVMOczZOkAh9s75+DeSolQcE
 RNs5otohZ0Z/GoILuPMZDYlUCh2Wiev6FvtZpSu0eVlgkuMqetj5/7JiMUBfAGEVkkrX5biKjpY
 JazV2CctQmXum0HPIG25+dTQz1Xx3t0E=
X-Gm-Gg: AfdE7cm9JN/VIh43Qn/Qg5mXXSZ44ccIZfkvBI9G1wNUmfOdP85SwXELgUlUM7tYTOl
 Ec0DTXfVvF0CCrqnha11CPwwWhGkjPLbBpkXcYn+JOdCK0mT2vnLWo40ce1syxPsi4KnzGvc2ko
 lOI9e2/lXM7nOskR7y8zptPy2yZ+FDv4Y2eTVTrp6RqkJ2SJ69+KpLur4jPegYYacPAfh4p/gC+
 1wCU4g+8PrEmywkjX6hVjvoxAkMndEQNa3tUick0NdZ7l8We/KMKk/gqCmndmd96HTezI/g7Gpq
 UjrR2RLTFFx+llnsZRzeD9oBqbPG4gDh3XAvS4GzsSzZcY23h0Q1NZNYSSvSllU+u1GSU92KM0D
 S9kFC3yn1I97T2Q==
X-Received: by 2002:a05:690e:1685:b0:664:ae6b:b48e with SMTP id
 956f58d0204a3-66521d6da0emr143158d50.67.1782883876544; Tue, 30 Jun 2026
 22:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-7-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260610214133.1882563-7-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2026 15:01:05 +0930
X-Gm-Features: AVVi8Cf5S4JHTzWCSpaPslLda1whiSE0GE5opuQv0XFG7BFe1-FGrhcyBnAKaoE
Message-ID: <CACPK8XcDX+x3MFLG+XRJVTrocVugoRio06DUsOLJPLA4D4MqnQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] tests/functional/riscv64: add riscv-server-ref TPM
 selftest
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com, uwu@icenowy.me, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 11 Jun 2026 at 07:11, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add a TPM specific selftest for the riscv-server-ref board.  The test
> will be skipped if there's no 'swtpm' in the host.
>
> The test has been basically cloned from our Aspeed ast2600 friends.
> Shoutout to monsieur C=C3=A9dric Le Goater for the code.

*cough*

 > commit c3d58a7a26ffbf2ac54ed6d7a3a83f2a7af7159b
 > Author: Joel Stanley <joel@jms.id.au>
 > Date:   Tue Mar 28 22:38:44 2023
 >
 >    tests/avocado/aspeed: Add TPM TIS I2C test

:D

Reviewed-by: Joel Stanley <joel@jms.id.au>


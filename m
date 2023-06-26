Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7810EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDkNY-0004nr-9i; Mon, 26 Jun 2023 07:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDkNN-0004iZ-8J
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 07:27:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDkNJ-0004Rn-2q
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 07:27:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso150245e9.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687778830; x=1690370830;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLujOKsXlm9KHQ1LLzZ/KxxngZ83aAuPeNX0wQ4oF3o=;
 b=xoGviNjLlVK3LXS4ytwHkp7qAVR5rE+63jHhYNeqnBwpmwRlNj0CiZkUgC4ry3rdfi
 O0lZwnhJnjocjd3QhQmukDyZI4Vrf3qSKFrBN1tBkNkUtDhicmSBKHsb60M16llJIjZc
 zpgJojGMxRAe5Yma42ZlBJBfoNZL2HEEGL42USGjIsdq06WxkpO4wXznfneR0r6tu1Td
 /MPpOIut6hAZMxs6yBI4EIHeAiRbvUaRLjrsX/5sjW1HbTPdtCkuX70BggqrpsED6hiO
 ZPqehV0LY5MD0OBepZ2sNaUUtkWmfWewVs298akda/ZZyVvw9hvwuAKl0dbnjVu0BEfJ
 RxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687778830; x=1690370830;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tLujOKsXlm9KHQ1LLzZ/KxxngZ83aAuPeNX0wQ4oF3o=;
 b=M1bdLCcc2R2SxBdMva/1O8tMHd6QNL+8CxnkkcwUnowtS8jkP7GXC4NlEdorazi1Da
 y7KEzYvh/2rggZ/dGTXP2EncffUI2GntZHMRCh52o6erTvZy3CS03zxv4p4ivoZgrxVC
 WoiPr0XOuShbL9+/wV2Qd69TIMsLg4I1waT9tY2b4VxWwUPr7OZBb2+6pnlvSexm9ESX
 5TrKA0jN3NDWftC9Zr+VVmgFR76/WYB0ypvMxbiwwQkYnEtfN+a9iRIAj3DQ9LKHB5zs
 J9Wa9/QyNdoGw83Zu6U5AwPjd3RDnwUyc46T9MXaXrSmnAVTK77o8Pp4PSkDs3PEL3Lw
 31Jg==
X-Gm-Message-State: AC+VfDzC+0AIx+h6GS31Vny5WxjOuVgYIIZKXoZtUHoNI//8UCe5zMzZ
 tbiPd4Vu41pneYmOLsfEc5oOCA==
X-Google-Smtp-Source: ACHHUZ6+h5mzA2e/z8p+aaOWs27g+a/oBwvzXEEnoK6TmXQInB4g41eLSfAeXh/8beQWvFbCxK+Bcg==
X-Received: by 2002:a05:600c:28e:b0:3fa:8aed:d57f with SMTP id
 14-20020a05600c028e00b003fa8aedd57fmr5063495wmk.24.1687778830614; 
 Mon, 26 Jun 2023 04:27:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1c4c0c000000b003fa9554fb30sm3031859wmf.44.2023.06.26.04.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 04:27:10 -0700 (PDT)
Message-ID: <deda3e29-654a-5a60-98bf-b97b0ada570e@linaro.org>
Date: Mon, 26 Jun 2023 13:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup@brainfault.org>
Cc: qemu-riscv <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Is it possible to boot a riscv32 guest on riscv64 host using KVM?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

I'm working on a tree-wide accelerator refactor and want
to run various configs to be sure I didn't broke anything.

QEMU theoretically supports running a riscv32 guest using
KVM on a riscv64 host, however the documentation I'm finding
only refers to riscv64 guests:
https://github.com/kvm-riscv/howto/wiki

So I wonder, is this a valid / supported config? If so,
do you mind helping me with pointing me to a guest image
and its command line?

Thanks,

Phil.


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5504C0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 16:44:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGT1-0002Tb-Br; Tue, 11 Jul 2023 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qJGSw-0002St-Ka
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 12:43:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qJGSu-0004j5-N9
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 12:43:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so31828175e9.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689093831; x=1691685831;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9Ybn31T0YcqlPttkNqJSMQTCNNcqd801abGfznEz80=;
 b=vYb+HP13YfRx3f3BMDIpU+yV5IyPKoJTBI179SHtErYTlWiQL+rteni+MB0WtNH2tA
 2/2gcPIQMoUvGBrcL52wbSh40WhptVVZSbabJIdDqAQUZHQ6XItuuPOJycU+w/vH72r1
 0GCKJISI+erTILANMrsndubXnQr4m7uliO1wUb+X5WLIuk7TYmjUHMzlfMpvsdsdyraN
 klIVVul7FOmkyC58CyDk+QHr87jNuwCk2+pEU4ps+cFJY7EtG9CltjjlzmVdWIjkBlE9
 Dm4Qsq/cdfS0GrpGpbgAJH3L5zGHW/+ZixBGaLw7b8I49nrbXLfdNqr66VzXQ4389MAp
 hWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689093831; x=1691685831;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x9Ybn31T0YcqlPttkNqJSMQTCNNcqd801abGfznEz80=;
 b=KcNjcgWVuek6bYjUDz/K9k/kFawFrNq/GAlvEZvq4TxMx+NAfmcnGf7wKJBl2xXJ/b
 O8+0C36CkQg3ieqgD7vzDdKGD6AlEZnMEndFwH2i5DvAQ0u2vDW1OIJ2piuJLxwGhvbS
 NBvRgLrflKZibhHoUZJjuKoSP7EOvUwAgceqUPcG0SZoAbD42ekAOnJR0ry/0D8b7BDC
 +517mjRw63ABA/4LfRb/TUSrpDEXnKXsX/l0K5Y90+IX5M5e+CEPsXwkHyOe3DZ9l8sF
 xwvB3hU+T/nZGBrD0zn4lsOr2+Mpq/mC3H8II9dMtb/hUwHupkHJDy+IK/p4hCM9DYIJ
 byRA==
X-Gm-Message-State: ABy/qLYsqD/osgmCDUpOduRC/CIxBltTKoDhHu+5gOs9AA76/2WF1Qyd
 4vmCRB1VmrJmfzivhlgD0j0PCw==
X-Google-Smtp-Source: APBJJlE1K7SBENvcTmkz1dF8vYmDrHUijeq5xFctxtu/D4K4TVUjMAI3Z4OC6fdDXxx0CQ7cGT1dWg==
X-Received: by 2002:a5d:58c5:0:b0:314:5f6f:68ce with SMTP id
 o5-20020a5d58c5000000b003145f6f68cemr14936342wrf.66.1689093830759; 
 Tue, 11 Jul 2023 09:43:50 -0700 (PDT)
Received: from [192.168.11.252] ([185.65.165.31])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d6387000000b003143801f8d8sm2680210wru.103.2023.07.11.09.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 09:43:50 -0700 (PDT)
Message-ID: <629afcc2-ffed-c081-9564-7faa6defc1f4@linaro.org>
Date: Tue, 11 Jul 2023 17:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: riscv kvm breakage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

Hiya,

This breakage crept in while cross-riscv64-system was otherwise broken in configure:

https://gitlab.com/qemu-project/qemu/-/jobs/4633277557#L4165

../target/riscv/kvm.c:209:38: error: ‘KVM_RISCV_ISA_EXT_ZICBOZ’ undeclared here (not in a 
function); did you mean ‘KVM_RISCV_ISA_EXT_ZICBOM’?
   209 |     KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
   205 |      .kvm_reg_id = _reg_id}
       |                    ^~~~~~~
../target/riscv/kvm.c:211:33: error: ‘KVM_RISCV_ISA_EXT_ZBB’ undeclared here (not in a 
function); did you mean ‘KVM_RISCV_ISA_EXT_MAX’?
   211 |     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
       |                                 ^~~~~~~~~~~~~~~~~~~~~
../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
   205 |      .kvm_reg_id = _reg_id}
       |                    ^~~~~~~
../target/riscv/kvm.c:212:37: error: ‘KVM_RISCV_ISA_EXT_SSAIA’ undeclared here (not in a 
function); did you mean ‘KVM_RISCV_ISA_EXT_SSTC’?
   212 |     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
       |                                     ^~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
   205 |      .kvm_reg_id = _reg_id}
       |                    ^~~~~~~
In file included from /usr/riscv64-linux-gnu/include/rpc/netdb.h:42,
                  from /usr/riscv64-linux-gnu/include/netdb.h:32,
                  from /builds/qemu-project/qemu/include/sysemu/os-posix.h:34,
                  from /builds/qemu-project/qemu/include/qemu/osdep.h:151,
                  from ../target/riscv/kvm.c:19:
../target/riscv/kvm.c:288:44: error: ‘struct kvm_riscv_config’ has no member named 
‘zicboz_block_size’; did you mean ‘zicbom_block_size’?
   288 |     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
       |                                            ^~~~~~~~~~~~~~~~~

Can someone have a look asap?  Thanks,


r~



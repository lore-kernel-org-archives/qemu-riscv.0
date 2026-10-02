Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB15FCA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCeX4-00087o-BT; Fri, 02 Oct 2026 10:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCeWz-00086m-LJ
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:46:39 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCeWw-0003sW-NE
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:46:36 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 956f58d0204a3-672f516c271so7033116d50.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952392; cv=none;
 d=google.com; s=arc-20260327;
 b=FZZsjTuBFmnJaN/mh39Qh6wkbfSXy3Qa0PBIek5UuHNoFFyPA/C1ITv8oGpjDaan/s
 Ek5WA7GyK2xg16/jhqNQ34qO7BpJZCbVjmy4XbmfTWIoTapmgR+FWyHGGtu2Wtlw4ki3
 +XD1mcTXsnbeoRHdOhglZe9J/PTNT/ECSao1VOx+njvwSzOhbZUOIA5Y8yaJZD9bx44q
 2EZTtSs6Ls99NDvBMxmo+oN3eujKS7o3/SHL/iLTL3Epr/uCpgVBvt/zHY33HqmtHabI
 AcVNdgqcM0HCWE0Ies9/AnVrM/8npDtO0GK6dvrDqfmjIDB++NY8bMwY5Ft5/Kkb+/OK
 Em2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 fh=8Lz/+WnqxhV95s2fKRhybE9G0vBZTOBeFiqoTbTC5sE=;
 b=SciTMO1MIB3ueQlR2FryLhPk+8Qki78OftHIxu8+MxICF0UKym41P6c87F+bPeEP6/
 711+QUbcaPMVq8OPtXwzQ0LZAs8k5a0rTJX/cGvtmkpIKLy0HSBhp687XN+X8/Ip+fs6
 aenGKhLpMBYeVR/SxdPissfZDAI+ZUN9qtXdWrvVGch4a4UwCfAyPe08asA1euQ+awOB
 3nKqjmTMdOiN/2675S9/S0jGCaWgRFDGcB+1AOXXlDpL2NezUfqiBupYobyG7/Migz1K
 Jy/iCtZnwIG1e2m/VDiDUcQjUY2JRplX6BVogCAxVddEzhx4RJM1lF5OyhzEgHIs/n7m
 M3Hw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790952392; x=1791557192; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 b=UM+bImMp1EcYgPmlJII+aPMkd8AZz3ROX1E7dt49XrYwF9vQFqbW6IvRa5MYXyTApt
 /77FRImcKboz/UmC2sP7XMdiDUfF+DPngptI8jGLWbXl63R+JaNX+5ZujLRcddncuvuo
 jEQNEfThHHLze60NpJlc7UVAG3BEZLYtkyFeSPMv9vjkmbxFPhxO/nNGRHvaZC7fwALv
 +dQS9n/kd9NUX8xLcca8oVwpGjcQOrOplAC/n4HZs+pnFdhSNisHkSx1MXhprFff+Zob
 xlDHOD1EPuts+mOyDHC+cw3lo07bL/k77B8B/dOnRD+98NU8afJwcG4VF3YPniF/gzph
 g6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790952392; x=1791557192;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 b=XHpm2SREq2ZTOZVi577fNei/6h4X41x1C07VZQ/lOQA2nXtPSQZRU8ObdjlCL2hHub
 UWIgY5yOC0OKlMM0LZxYZ5F3gohkJNJ8GSAzgtzXG0JvHryjigqmR6o6k0UUOK+8PcvY
 kaiB+Z4IH3xujNuF4b5yeNjeCwl4Aeh0ke1mrXiXoFWE1ATcOo1kRabRyuSygQizcryZ
 8F/0NQ5CVlOJnSdkb+j8pK5CdEwR3v91ZInXLrI4LvgayA9sYDoXAJb9l8CxOXMakvEI
 +uorf/dDFZ7UIjBwcUtVqpoo4nGaU1fUeBr4tslyDaxsK5b+nsnLl2YvpbT1Gsvmgzhm
 tDVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuOeqn0qkFEjFtYF1mbvu75wusFNRoKamIbhPnn1JapTC0t37/x7OLN2zACpCJxkpsLCkYgA2zDK5x@nongnu.org
X-Gm-Message-State: AFq9FYJVxiIufP6XhRkbjCBbqckliFwDLwD550LzTn7i+m9QKq/Qdqe2
 mnB6NHBDvnoUOXkYAHrFau7UdktAkrem6MSEglyiQGDJErgOzpgJBEnBxbA4qD4VtI3Ykwjhs3J
 nSZa9l99AIsSKqgd9yELLq/4eRW3USq/kctFz7jauQg==
X-Gm-Gg: AYBFou3fDy91WWYppL6ZpLXUiTsUpVcLeBFCVGchkRjRxG5UGEubMGaUqaIQF9vvRh0
 HhxX5mAEDbtNnSJfq8Qy67p6DaLp46drGgZ66F5hS4wplQRqpE6yBL4HbPgk9u6RRZkjo867MA0
 O7IeKNn1JoeOYjUvNXanxCYoFPAZ2ye7YFdln9ucTEXxzf0SBe7ZA59mpeSPbsAq0fv23Rq8hsI
 uCNGPdjC/B+YxNLHiHo1JM2pr+T4Uzi/n0ioy2EmrjZbm5oVpZEb+Ric5fI/fcq9YI6JIyVyxDw
 Qlv4rCat0kdzwLenHffAb9uu8RVF0Wjk8h9+pZCZe//mBvxwK6qUGB8V+y9ih0bb8PgNCO0XBfB
 ncYiFkl1b4zGJnD2D/a2kA8ajU3In4y2klxwPhEk=
X-Received: by 2002:a05:690c:dd5:b0:8ae:8d28:77b6 with SMTP id
 00721157ae682-8ae8d28827dmr2796367b3.41.1790952392226; Fri, 02 Oct 2026
 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-5-philmd@oss.qualcomm.com>
 <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
 <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
In-Reply-To: <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Oct 2026 15:46:21 +0100
X-Gm-Features: AclHuK-N7jZnW5v3yjx5u5hYWXxHIx7oDI_Nuia5TNL-57X1H-xPAy_-gw54sV4
Message-ID: <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt()
 callback contract
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 2 Oct 2026 at 15:37, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> Does that update sound good to you?
>
> * Called from cpu_handle_interrupt() with the BQL held. Identify which,
> * if any, of the possibly multiple pending interrupts specified by
> * @interrupt_request should be taken, using the target architecture's
> * prioritization and masking rules. If an interrupt can be taken, update
> * the emulated CPU state for interrupt entry.

Looks good to me.

> With the update desc I wonder if we should rename the
> helper as cpu_take_interrupt()...

Mmm. the "exec" in the current method name is "because it's
called by cpu_exec", I think (compare cpu_exec_reset,
cpu_exec_halt), which is not necessarily a very useful thing
to encode in the method name.

I guess my opinions are:
 * don't bother renaming unless we think we have a clearly
   better name/set of names
 * if we rename one of the cpu_exec_foo then we should probably
   rename all of them in some consistent way
 * a new set of names would ideally make it clearer what the
   difference is between do_interrupt and cpu_exec_interrupt
   (I can't remember myself why we need both or what the difference
   is offhand...)

thanks
-- PMM


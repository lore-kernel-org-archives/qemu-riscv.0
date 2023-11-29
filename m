Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D76C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 08:21:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8FoW-0006rl-CP; Wed, 29 Nov 2023 03:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r8FoS-0006qj-Uq
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 03:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r8FoR-0000fl-1S
 for qemu-riscv@nongnu.org; Wed, 29 Nov 2023 03:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701246049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S/3cDfRa5LH4GWX/yLB4BmmZ5fLLYCoRPZZdEvvflmc=;
 b=fGFNCRjUjWLuBhZP83jAks/iAMP3GWg/ZDHkZbC0nDXo1TbCtkd0y65UCFHdXNRmOMWN6+
 DRkcSxXKZwpSJxYk9oH4IF86399IP1dGrzsG9Yg30XUAqzxFcb7GKqWNZuCmGKkCcpHah7
 PtCmzQX3Cw+voPZBwHRXAugHhIKlEwk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-H-wAc1oJMQuj81Eds4H6LQ-1; Wed, 29 Nov 2023 03:20:45 -0500
X-MC-Unique: H-wAc1oJMQuj81Eds4H6LQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30733101A529;
 Wed, 29 Nov 2023 08:20:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E441220268D6;
 Wed, 29 Nov 2023 08:20:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF53721E6A1F; Wed, 29 Nov 2023 09:20:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,
 peter.maydell@linaro.org,  imammedo@redhat.com,  b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com,  sundeep.lkml@gmail.com,
 kfting@nuvoton.com,  wuhaotsh@google.com,  nieklinnenbank@gmail.com,
 rad@semihalf.com,  quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 vijai@behindbytes.com,  palmer@dabbelt.com,  alistair.francis@wdc.com,
 bin.meng@windriver.com,  liwei1518@gmail.com,  dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,  shan.gavin@gmail.com
Subject: Re: [PATCH v8 1/9] machine: Use error handling when CPU type is
 checked
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-2-gshan@redhat.com>
Date: Wed, 29 Nov 2023 09:20:41 +0100
In-Reply-To: <20231129042012.277831-2-gshan@redhat.com> (Gavin Shan's message
 of "Wed, 29 Nov 2023 14:20:04 +1000")
Message-ID: <87bkbdnf6u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Gavin Shan <gshan@redhat.com> writes:

> QEMU will be terminated if the specified CPU type isn't supported
> in machine_run_board_init(). The list of supported CPU type names
> is tracked by mc->valid_cpu_types.

Suggest to drop the second sentence.

> The error handling can be used to propagate error messages, to be
> consistent how the errors are handled for other situations in the
> same function.
>
> No functional change intended.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v8: Drop @local_err and use @errp to be compatible with
>     ERRP_GUARD()                                          (Phil)
> ---
>  hw/core/machine.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0c17398141..bde7f4af6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>  
>          if (!machine_class->valid_cpu_types[i]) {
>              /* The user specified CPU is not valid */
> -            error_report("Invalid CPU type: %s", machine->cpu_type);
> -            error_printf("The valid types are: %s",
> -                         machine_class->valid_cpu_types[0]);
> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(errp, "The valid types are: %s",
> +                              machine_class->valid_cpu_types[0]);
>              for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
> +                error_append_hint(errp, ", %s",
> +                                  machine_class->valid_cpu_types[i]);
>              }
> -            error_printf("\n");
>  
> -            exit(1);
> +            error_append_hint(&errp, "\n");
> +            return;
>          }
>      }

This cleans up an anti-pattern: use of error_report() within a function that
returns errors through an Error **errp parameter.

Cleanup, not bug fix, because the only caller passes &error_abort.

Suggest to start the commit message with a mention of the anti-pattern.
Here's how I'd write it:

    Functions that use an Error **errp parameter to return errors should
    not also report them to the user, because reporting is the caller's
    job.

    machine_run_board_init() violates this principle: it calls
    error_report(), error_printf(), and exit(1) when the machine doesn't
    support the requested CPU type.

    Clean this up by using error_setg() and error_append_hint() instead.
    No functional change, as the only caller passes &error_fatal.

Whether you use my suggestion or not:
Reviewed-by: Markus Armbruster <armbru@redhat.com>



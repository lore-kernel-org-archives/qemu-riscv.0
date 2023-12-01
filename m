Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB50C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 15:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r95sz-0004Hk-Lu; Fri, 01 Dec 2023 10:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elio.vinciguerra@phd.unict.it>)
 id 1r94ZT-0003xM-JP
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 09:32:49 -0500
Received: from mail-db8eur05on2072.outbound.protection.outlook.com
 ([40.107.20.72] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elio.vinciguerra@phd.unict.it>)
 id 1r94ZP-0002bx-I1
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 09:32:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxmrpwrYzGyJSpa/BYefPTTL8RChs50zz99sUw6+o+TOEYiwfTMqyTGcI3NQUtp9cO8D23NZRaWxQppgZkQQ+C9Dh07H8Qp6QNKLiOg0toGW3m5EH6Ajd7UoqUwYrx+wHhdVDkuZPH10w/H9pYE4nh45Di/6mIDnjctRGEPu9Jj2Ru9cZ8adcijh2yOfD32clydokNaorUj6f7mg3XiMArfZrqCYNdT0+o46AAok5CIfS0FEVAzDHQuNp2IPHLxkC7XbYTc3oBc40zpOFk3stmEIEu2fTVgPAnV3wuLMOz8JrFSCWG0qMGOhmJU/IfjxKbKsbM665N1xtNdeAKm5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcy7tqAG0Oq8d1z16s37ZP4Ise03uWOL2LYXPKHUqEg=;
 b=J09z57bleZGCZbrGCGoCzITzCrxpdDdK9yFsE27g2OHNbnkRsS6bJZdD0SOrDapuym7NL3AE0YRYq6eQrRGYPVmvCPzxZeD1UNK1leySHp0UIBKLtzZhUpPnWYQ329HCzbdGHTFmyJnwuMfLlQZ06ylFq1aqAwD65gi45vnCGCRitwnZ5kovrPLL9+olZLOn4RJ4KuYvohc2/0TEH9F8d45WC9vGHx4U67M79bztd+2WjVJiRvWfhAlw7xw6lDkjE/5MVnGPDYPdGj1+XUoNrjJXtvbTsGy9+FXhsGi8tFosAj0yL7VG38qK9yfemYT1ZqfPIGDApUGvI7AlcUDUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phd.unict.it; dmarc=pass action=none header.from=phd.unict.it;
 dkim=pass header.d=phd.unict.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentiunict.onmicrosoft.com; s=selector2-studentiunict-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcy7tqAG0Oq8d1z16s37ZP4Ise03uWOL2LYXPKHUqEg=;
 b=MdvkT95rEN8Rd6hCVlgKWZgJ0mpkywY17YdcKEQa3ng88DIv3mcqEUiTwtgLDnPPQa2VhH4MY/RnLemK4Vjc3J+1PT3ypTw9Uacd8O6n9ycYwHHFKJCWvYX2qok5dk6q91HeiayMX8gB5xPb5GAlNURZVcrbpujsPGds/FD2ETk=
Received: from AM4PR02MB2994.eurprd02.prod.outlook.com (2603:10a6:205:8::23)
 by AM9PR02MB6964.eurprd02.prod.outlook.com (2603:10a6:20b:263::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 14:27:37 +0000
Received: from AM4PR02MB2994.eurprd02.prod.outlook.com
 ([fe80::3f17:2c7:f817:3b1a]) by AM4PR02MB2994.eurprd02.prod.outlook.com
 ([fe80::3f17:2c7:f817:3b1a%5]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 14:27:37 +0000
From: ELIO VINCIGUERRA <elio.vinciguerra@phd.unict.it>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: =?utf-8?B?QWJvdXQgUklTQ1bigJlzIFBlcmZvcm1hbmNlIENvdW50ZXJzIGFuZCBRRU1V?=
Thread-Topic: =?utf-8?B?QWJvdXQgUklTQ1bigJlzIFBlcmZvcm1hbmNlIENvdW50ZXJzIGFuZCBRRU1V?=
Thread-Index: AQHaJGKIDdGQ75/HV0qE/fZS/wPQkQ==
Date: Fri, 1 Dec 2023 14:27:37 +0000
Message-ID: <25092274-76c6-4d34-a3c4-cae3214bc277@Spark>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phd.unict.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR02MB2994:EE_|AM9PR02MB6964:EE_
x-ms-office365-filtering-correlation-id: d6ac0cc7-04dc-4396-bdd1-08dbf279aad3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AKpNAP/8PtlhhARdYmylVJhbM9kn8ANtnTBnNuclEgnxB/9jpQa96AzmHLxn9MGwfS7QLEFvIECp7Dxnb0hLqpAKwV3UWOfYq5Zta97l9b338234G5kcLX2YDNWmZZVIGVAESlLl0XK7PuwPuE/IXWdDnJFifjZdcFWcGT6Kk92oJd3LakdMLh+qucnvoMolEF87ik9YnZ3z8sbir61ZCwt4Fowb6P1KT/Hi04WJN338gc1gmn4b7ero2L/qzOSMrpgZJ3CwW/SFWy1yeA5CLjhAboXuZnoGfO/Jp9zvEQh+zeEEMcXd4XXscreVhr7sJYPBmK25HFMd/9Tc51a8cH0gY5tOAdi2jboxt0ftGp0Km7IgwD67yH8SJ+FIzVj5tHx0P5X6tOpKwWlOz99rOpwiFntgUI1p/I5ogzMIaosNJFwgqVWRbYY7YzSEECZ1vgvbgxDy9XWovV7JuBTI9Z4G139g8Oq8jF8M/kVld3QLUYfhyvSXKhlKIR2eYciAj15iXQQC/S9NvHGb7+XsVrIpJEfK9v9V4Rz8u+zkaUzSwwTubtMVyjLaUPmLTpwaUGAa90ofiKny6gfvRqPRMWZArd21sWVae8TXwSwZ1ziabKiANVfuLBIkS/UcjWz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR02MB2994.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(33716001)(26005)(6506007)(71200400001)(6512007)(9686003)(786003)(316002)(76116006)(83380400001)(66446008)(66476007)(66556008)(66946007)(64756008)(6916009)(31696002)(8936002)(478600001)(6486002)(91956017)(38100700002)(122000001)(31686004)(41300700001)(38070700009)(4744005)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTBVcCtHbkJwNHg3TGF6NHNKMUVubVBPTlp1V3hoc0R4dndPNmptMUV3OWtF?=
 =?utf-8?B?UXNiUXJRNG9ZVEc0bU44MEd5Z1BKSFMxVU5KZ0NodnV5aFROQThSQVJXNXkv?=
 =?utf-8?B?aEx4SnIrTno4OXhUbk5ueTQvQnlxTTBUbklGUWdOUWxjOUJzSnpKbFBzOFhB?=
 =?utf-8?B?a3kxRVJXTFZJYksyVnFSdm1MK3pOdEVMOHp6Qm9Fa0JOdlpGc2lKaW1wa0JG?=
 =?utf-8?B?MUV6a2gveUcrRGdCbDBvTCs0QUNuOWhBUjRuc2JXZXNFOVUxTVFBN1pMWjFX?=
 =?utf-8?B?ZnB3S05oNUV1MjM5cHVOMFN1QzVnWnF1ZlFRR05nV21Sa3hVSDRja0tzQnFY?=
 =?utf-8?B?YmJUek42Z3ArdTNJcVlmTG5LNCtPMkNaNjdObHlkYVZrdGl6Z21vSkF3ZXE3?=
 =?utf-8?B?ZUcraENlWU8weFRlQlFFZG1UOTI2d3FUVlNRNjMzaUFzT3BEZk9hTWVXenJk?=
 =?utf-8?B?SWRhaXluTmd0YXpFTG9RSzRHUzVTWXB4d2ZlYjUvWFVKc2k5WTZ6TWE2NmVu?=
 =?utf-8?B?NlVvemI1R0NLS2dBajM4ZTN6Qm90QWJtQVN4bzlOQWlRa2hYVTBtTWxYM3Uz?=
 =?utf-8?B?UTZyVDN2Sno1cUd4RXFXSFp0aWJXbU8rYUFWelBTN2pjZ2prdmJ4QkxTcDln?=
 =?utf-8?B?Zi9uUDhCWjlOVmYrNnpndE5aRjJwTHloUW84dmZUcjBDVFYzK043dDlDcys2?=
 =?utf-8?B?K2FnSXlQeDJxamw3ay8vMDh4dnc0Q2tXK0lHdnpPemlGZDNqK2FzbUFudVVF?=
 =?utf-8?B?S2txcFoyenUzT1VuYS81RVlEdjB3eEkxKzFhb1Y3Y0d6T2RWTVZIODNZWEg4?=
 =?utf-8?B?dzcybnRyaTNidHNpbGRQLzB3M3JlUG5ZU3loNkJFK3MyRForS01KWEZDSW84?=
 =?utf-8?B?ZVlLRHVUZlVhd3NtenhDWFg1OTQ1RDgyZitNNTgrSDJudkVMRTJVMXRqVnVa?=
 =?utf-8?B?RHE0eHNpaVNpQWJ2N1orTnVpYmQvMEVxdnpjcjdpc1dneEZDUG0yV2w1bVcz?=
 =?utf-8?B?QTBPT0ZRWE1LVGF6TWhqVFU1azB2bHh6ejBTZ3BFRE9pbEIxa2dma3doS3J0?=
 =?utf-8?B?UkN4WS9teTBsdlRVN2NYQ2taTlBjSnhFdW1SUDFHRWI4bHdSdG50OFJ4bW1I?=
 =?utf-8?B?TWpaV2o0bnlnMjB1Y0ZwcXJRRXBtWlRvRFNFZnp3R3VsdlZBd09mcGZxRkhE?=
 =?utf-8?B?SVc0K1R0clA3WnhISlpYWVpyOFhRanFOeCtvck8xbXBRVmtRQ05wRCtxTC9w?=
 =?utf-8?B?eGZFQXRhendpU1J2S3hDU0puN1VnNjhzOXpFQkF2RWVQdWxrbnd5WGlyd2w2?=
 =?utf-8?B?Q1Q0OU4ycmFQTzRPVnhDZlJGQ3ZaL1lteU1iSnBqenNBREh6QjVMTlRGTHNr?=
 =?utf-8?B?dXZ5eUErbG40OTN0MFkvSy9QbjA5NkN0dnE5YTBDZGtZeHRWY21nRUZ1cDZW?=
 =?utf-8?B?eU92L0E0UjZQcXFSWjlJSWVBSmlLZ3lnS1pEMTZCZkd3YlZDSHVDYkNWWmNh?=
 =?utf-8?B?Y2N0WUZWN1hxNXY3RURoZ1VkVWs0ZVg4bFp0NHRvMHVBNFIxTTdKdEthU1pZ?=
 =?utf-8?B?SVhJZnBiUGYvcjFjMzBCdm1UOTZQMmt2RGNpTEZBbjY4NFluWVlPOGc2VDlu?=
 =?utf-8?B?aHkvVUhiZklEYnBzdlZlSFdVdXpHUnJCWCtDcFJ5eUkxRTMxQnNlN2haZk9m?=
 =?utf-8?B?bys5dDBaazdaQlhWajlSM05pMk9LNU9vNDNXeFJWamtRQVFBWjhrT0p5b25m?=
 =?utf-8?B?QUw2TGxKbTVxOW45Z252ZllqRlMrSGc1NncwQzhwS1d0Rnc3WEZtTFcySytT?=
 =?utf-8?B?cXJBZDB3MGk2aXE4aDRvTi84WStZamNpenJiUDM4WHBYYlhXQmlIcWVvZVFD?=
 =?utf-8?B?Zk13dUtQUmZWTG1RZXVmVUo1RFFFUHVBTHdUOVhNUEZsTzZoaFlDSnQ2SjBh?=
 =?utf-8?B?dWRneU5TZWxGTy9ZZHFvTXdOQm5rNTY1c0VnNHRkYTRFaGZKaTBEVTR5L3lS?=
 =?utf-8?B?WFJpLzk5Y0N0L0Y2Z2w5eFpMV1ltTTU5SG8rQmNDMmVYMWNSZ0ZIdlM5M0U3?=
 =?utf-8?B?b1c0UFZyTVZVZVIybEhDVCsvaElibTRNYkQ0MHZkL3JjcHU2eHdaV05Rbjg2?=
 =?utf-8?B?SWZVaWN2OENnd0ZOMW5aYnBjc3MvWWVFYkRJTkVSdmcxNHRZeWtQalpGYS9X?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_2509227476c64d34a3c4cae3214bc277Spark_"
MIME-Version: 1.0
X-OriginatorOrg: phd.unict.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR02MB2994.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ac0cc7-04dc-4396-bdd1-08dbf279aad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 14:27:37.3743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: baeefbc8-3c8b-4382-9126-e86bfef46ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7b7Ln4SUDKPK68ElgOsQf6yWw6nHCDMk5+6O8c/URGsJ+O6oTI2OQLffY50ribtEb8BPouq9ByLpfO15eK+l+KJgIemDa8bjAl9mHbcGrJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6964
Received-SPF: pass client-ip=40.107.20.72;
 envelope-from=elio.vinciguerra@phd.unict.it;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 01 Dec 2023 10:56:59 -0500
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

--_000_2509227476c64d34a3c4cae3214bc277Spark_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgZXZlcnlib2R5LCBJIHJlY2VudGx5IHN0YXJ0ZWQgdXNpbmcgUklTQ1YgYXJjaGl0ZWN0dXJl
cywgSSB3b3VsZCBuZWVkIGEgd2F5IHRvIGFjY2VzcyDigJxocG1jb3VudGVyWzMtMzFd4oCdIHJl
Z2lzdGVycyB1c2luZyBRRU1VIGVtdWxhdG9yLg0KDQpUaGUga2VybmVsIHVzZWQgZm9yIHNpbXVs
YXRpb25zIGlzIGEgQyBwcm9ncmFtLCBub3QgYSBoZWF2eSBvcGVyYXRpbmcgc3lzdGVtLCB3aGlj
aCBpcyB3aHkgSSB3b3VsZCBuZWVkIHRvIGFjY2VzcyB0aGUgcmVnaXN0ZXJzIG1lbnRpb25lZCBi
ZWZvcmUgdmlhIGFzc2VtYmx5Lg0KDQpUcml2aWFsbHkgYWNjZXNzaW5nIGFueSBvZiB0aG9zZSBy
ZWdpc3RlcnMgYWx3YXlzIHJldHVybnMgemVyby4NCg0KVGhlIHF1ZXN0aW9uIGlzOg0KQXJlIHRo
ZXNlIHJlZ2lzdGVycyBlbmFibGVkIGluIFFFTVU/IElmIG5vdCwgaXMgaXQgcG9zc2libGUgdG8g
ZW5hYmxlIHRoZW0gb3IgYXJlIHRoZXkgaGFyZHdpcmVkIHRvIHplcm8/IEhvdz8NCg0KVHJ5aW5n
IHRvIGFjY2VzcyB0aGUgcmVnaXN0ZXJzIOKAnGN5Y2xl4oCdLCDigJxpbnN0cmV04oCdIGFuZCDi
gJx0aW1l4oCdIHRoZSB2YWx1ZXMgY29tZSBvdXQgdG8gYmUgbm9uLXplcm8sIHdoaWNoIGlzIHdo
eSBJIHRoaW5rIGl0IGlzIGFsc28gcG9zc2libGUgdG8gZW5hYmxlIOKAnGhwbWNvdW50ZXJbMy0z
MV3igJ0sIGJ1dCB0aGUgbW9kZSBvZiBvcGVyYXRpb24gaXMgdW5rbm93biB0byBtZSwgY2FuIGFu
eW9uZSBoZWxwIG1lPw0KDQpSZWdhcmRzLA0KRWxpbw0K

--_000_2509227476c64d34a3c4cae3214bc277Spark_
Content-Type: text/html; charset="utf-8"
Content-ID: <533CD2701DB3E0418D386CCAEE4F6F80@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiPg0KPGhlYWQ+DQo8bWV0
YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11
dGYtOCI+DQo8dGl0bGU+PC90aXRsZT4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBuYW1lPSJtZXNz
YWdlQm9keVNlY3Rpb24iPg0KPGRpdiBkaXI9ImF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAw
MDAwO2ZvbnQtZmFtaWx5OlRpbWVzO2ZvbnQtc2l6ZTogbWVkaXVtIj5IaSBldmVyeWJvZHksIEkg
cmVjZW50bHkgc3RhcnRlZCB1c2luZyBSSVNDViBhcmNoaXRlY3R1cmVzLCBJIHdvdWxkIG5lZWQg
YSB3YXkgdG8gYWNjZXNzIOKAnGhwbWNvdW50ZXJbMy0zMV3igJ0gcmVnaXN0ZXJzIHVzaW5nIFFF
TVUgZW11bGF0b3IuPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0K
PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjojMDAwMDAwO2ZvbnQtZmFtaWx5OlRpbWVzO2ZvbnQtc2l6ZTogbWVkaXVt
Ij5UaGUga2VybmVsIHVzZWQgZm9yIHNpbXVsYXRpb25zIGlzIGEgQyBwcm9ncmFtLCBub3QgYSBo
ZWF2eSBvcGVyYXRpbmcgc3lzdGVtLCB3aGljaCBpcyB3aHkgSSB3b3VsZCBuZWVkIHRvIGFjY2Vz
cyB0aGUgcmVnaXN0ZXJzIG1lbnRpb25lZCBiZWZvcmUgdmlhIGFzc2VtYmx5Ljwvc3Bhbj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOiBtZWRpdW0iPjxicj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOiBtZWRpdW0iPjxicj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMDtm
b250LWZhbWlseTpUaW1lcztmb250LXNpemU6IG1lZGl1bSI+VHJpdmlhbGx5IGFjY2Vzc2luZyBh
bnkgb2YgdGhvc2UgcmVnaXN0ZXJzIGFsd2F5cyByZXR1cm5zIHplcm8uPC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjojMDAwMDAwO2ZvbnQt
ZmFtaWx5OlRpbWVzO2ZvbnQtc2l6ZTogbWVkaXVtIj5UaGUgcXVlc3Rpb24gaXM6PC9zcGFuPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJj
b2xvcjojMDAwMDAwO2ZvbnQtZmFtaWx5OlRpbWVzO2ZvbnQtc2l6ZTogbWVkaXVtIj5BcmUgdGhl
c2UgcmVnaXN0ZXJzIGVuYWJsZWQgaW4gUUVNVT8gSWYgbm90LCBpcyBpdCBwb3NzaWJsZSB0byBl
bmFibGUgdGhlbSBvciBhcmUgdGhleSBoYXJkd2lyZWQgdG8gemVybz8gSG93Pzwvc3Bhbj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOiBtZWRpdW0iPjxicj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOiBtZWRpdW0iPjxicj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IzAwMDAwMDtm
b250LWZhbWlseTpUaW1lcztmb250LXNpemU6IG1lZGl1bSI+VHJ5aW5nIHRvIGFjY2VzcyB0aGUg
cmVnaXN0ZXJzIOKAnGN5Y2xl4oCdLCDigJxpbnN0cmV04oCdIGFuZCDigJx0aW1l4oCdIHRoZSB2
YWx1ZXMgY29tZSBvdXQgdG8gYmUgbm9uLXplcm8sIHdoaWNoIGlzIHdoeSBJIHRoaW5rIGl0IGlz
IGFsc28gcG9zc2libGUgdG8gZW5hYmxlIOKAnGhwbWNvdW50ZXJbMy0zMV3igJ0sIGJ1dCB0aGUg
bW9kZSBvZiBvcGVyYXRpb24NCiBpcyB1bmtub3duIHRvIG1lLCBjYW4gYW55b25lIGhlbHAgbWU/
PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6IG1lZGl1bSI+PGJyPg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjojMDAwMDAwO2ZvbnQtZmFtaWx5OlRpbWVzO2ZvbnQtc2l6ZTogbWVkaXVtIj5SZWdhcmRzLDwv
c3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiBtZWRpdW0iPjxicj4NCjwvc3Bhbj48c3BhbiBz
dHlsZT0iY29sb3I6IzAwMDAwMDtmb250LWZhbWlseTpUaW1lcztmb250LXNpemU6IG1lZGl1bSI+
RWxpbzwvc3Bhbj48L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_2509227476c64d34a3c4cae3214bc277Spark_--

